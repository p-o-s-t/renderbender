// https://gist.github.com/natesubra/0577178177ef64adce0866ee71ada41a
rule Email_iCal_Spoof_Detection {
    meta:
        author = "Nate Subra"
        date = "2025-05-27"
        description = "Detects emails with iCal attachments where ORGANIZER is a target domain but sender is not."
        severity = "MEDIUM"
        version = "1.2"

    strings:
        // Define a variable for the target domains
        // This regex group will be used in other regex strings
		// Populate this with the list of authorized domains that you expect icals to be forwarded or sent from from
        $target_domains_regex = "(natesubra|example)\\.com"

        // String to identify an iCal attachment by its Content-Type header
        $ical_content_type = "Content-Type: text/calendar" nocase ascii wide

        // String to identify the beginning of iCal content
        $ical_begin = "BEGIN:VCALENDAR" nocase ascii wide

        // Regex to find 'ORGANIZER' field with the specific domains within iCal content
        // This accounts for various formats of the ORGANIZER field, including common CN (Common Name)
        // We use the $target_domains_regex variable here
        $ical_organizer_domain = /ORGANIZER(?:;CN=[^:]+)?:mailto:[^@]+@#target_domains_regex/ nocase ascii wide

        // Regex to find the 'From' header with the specific domains
        // We use the $target_domains_regex variable here
        $from_header_domain = /From:.*<[^@]+@#target_domains_regex>/ nocase ascii wide

    condition:
        // Ensure it's likely an iCal attachment by checking content type or begin tag
        ($ical_content_type or $ical_begin) and
        // The iCal content must contain the specific organizer domain
        $ical_organizer_domain and
        // The email's From header must NOT contain the specific domain
        not $from_header_domain
}
