resource "cloudflare_zone" "domain_pwnyboycom" {
  zone       = "pwnyboy.com"
}

resource "cloudflare_record" "domain_pwnyboycom_A" {
  name    = "pwnyboy.com"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "100.84.65.30"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "domain_pwnyboycom_AAAA" {
  name    = "pwnyboy.com"
  proxied = false
  ttl     = 1
  type    = "AAAA"
  value   = "fd7a:115c:a1e0:ab12:4843:cd96:6254:411e"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "domain_pwnyboycom_wildcard" {
  name    = "*"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "pwnyboy.com"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "mail_pwnyboy_verification" {
  name    = "pwnyboy.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "protonmail-verification=5fdf94f6fea813d10ba884cef3a22b3300bd5d22"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "mail_pwnyboycom_mx1" {
  name     = "pwnyboy.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mail.protonmail.ch"
  zone_id  = "8591d068f98cfcd568b61af7deb27d49"
}

resource "cloudflare_record" "mail_pwnyboycom_mx2" {
  name     = "pwnyboy.com"
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mailsec.protonmail.ch"
  zone_id  = "8591d068f98cfcd568b61af7deb27d49"
}

resource "cloudflare_record" "mail_pwnyboycom_spf" {
  name    = "pwnyboy.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.protonmail.ch mx ~all"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "mail_pwnyboycom_dkim1" {
  name    = "protonmail._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail.domainkey.dhdoyd6pggpsfjndj4jobv5u3z63xoewvx2gdk2obmnrhcsllth3q.domains.proton.ch"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "mail_pwnyboycom_dkim2" {
  name    = "protonmail2._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail2.domainkey.dhdoyd6pggpsfjndj4jobv5u3z63xoewvx2gdk2obmnrhcsllth3q.domains.proton.ch"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "mail_pwnyboycom_dkim3" {
  name    = "protonmail3._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail3.domainkey.dhdoyd6pggpsfjndj4jobv5u3z63xoewvx2gdk2obmnrhcsllth3q.domains.proton.ch"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}

resource "cloudflare_record" "mail_pwnyboycom_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine"
  zone_id = cloudflare_zone.domain_pwnyboycom.id
}
