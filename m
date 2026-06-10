Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TsFtDlmJKWrEYwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:13 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 076AE66B16E
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=RGEtttG4;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 26D6F40A24
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 15:57:12 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	by lists.linaro.org (Postfix) with ESMTPS id B567540A38
	for <greybus-dev@lists.linaro.org>; Wed, 10 Jun 2026 01:14:52 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8ccf6a63a45so76814876d6.3
        for <greybus-dev@lists.linaro.org>; Tue, 09 Jun 2026 18:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781054092; cv=none;
        d=google.com; s=arc-20240605;
        b=h209qLVNfXuanR/Ddcx+ttIIwCC/GTbA8JspohvyE7o5F1Mm4zwq5SgVCjrHASVc9O
         TQ/A3mMJZ/P1e624jHWfg4auPefCYt/BKo916dY32dHhv/V8Y1pFUFq15S5OvYP2tbdE
         Xiu63pVskSVPXA6bJnO7u4GnpK1bijJQ+plukAjMCfPYF46PTQd7O1R8slUQxBs/0UaX
         jHCDuqt7We6dwnUo18D9nbADmVaopvlShH36QkX0BrbK4LnwqtynnKj7TsZYCReX1We2
         DAOegsWBW8yvLCc+aVLhGAiruU9qiLJx+O/9ewYaDboBZqqc36rjK2k2RX0ZAG4IURFK
         AQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ChYnJlEHoZXI5v6H3MMgohIBDxc31asjLW8UfDy9l7s=;
        fh=KJCVC/6bOSF9pEmpduX0sL5CGqwdAxLO5preo9USLpw=;
        b=b4htzMQTtqV1hzdjQg6jZvq0Hm3pOxGKjxi6wt+h9JxCZ46KSlrd2Q9166FVxI0Zn8
         TgtCeKgpPI2YSQLPBkz2Hyq8sOvM9PkrNGVrzX3J4AKECoeRAfkysyTXx/SXIGP+bT19
         Y/I7Xh0Rev2RzdX9W8MnkoC/9VYahNPKxhZxBEO63FY99ZrVE+toMsFl4CgfA8QeTLzd
         pRbNCDd39URkC1IrY+D/QyYYIl0nFRl0RDF5qGjFkuvy61NqKkpzw0PCP+/ptx4Ri6ov
         fHV4Nuvi9xjNHVhgBTvcWrLvzjUvJQXTaHAOTdWlNKAr0bOD5WSBKDV/c7P/L41s8d1A
         NjsA==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781054092; x=1781658892; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChYnJlEHoZXI5v6H3MMgohIBDxc31asjLW8UfDy9l7s=;
        b=RGEtttG4wWm8knexu5SHDkqS67RsN3rq4NcJfaMHIxmtyXIJf7ISq3xVxuwCP3IyvC
         E1M4ZeLpgeIn7rUtd4oM8f62mMOTwal+hOQpCG+QViD4ZpIiALvFcOfaJ4ztyKd2Ege2
         yjKjdcHQ0vqKOxV5MhH4/m+LARlSI/Jo3ep94+mht2HtvTuqH8WGlxklUzAo4mKj/+Nv
         r1R8jI4P1MFubpcIDw31dIqMgdnHFD+7x5YSobwMj0cOt3/vdhrHlp+7eLILTC5N9p8l
         70UZyZlb77timXaXxNhYkx6FbAF2jYAZBfEVtR5mvHAa0KJa9V26Ob7/J9NS7apKW0tz
         4YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054092; x=1781658892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ChYnJlEHoZXI5v6H3MMgohIBDxc31asjLW8UfDy9l7s=;
        b=Ieonfmm4NQWGjYonJ9hEA+lBElM0s9SzCCSN7fR+QszllXjnoDX18J2xuOuPFyBA1p
         41pPdjzqCHlFhiUIeG3rF4lLO3OXwNXwXylIqC325V1nuaByqbt7dx9nWor2aNpKZVCk
         Q3VK726cnb9XWJu1ps3LYpcVYK+uZqidpZMcaDSul6eT3Cmq1DAMF3CerMuh5T6sLBFP
         UYJqA6CaOLkbbOWYqNexRMZDEqmaqmhPNRN44n4zXC5b6Wv4me2iCbJW9AyL8te/Kw9g
         FKLZQPTsOB/LnsRZiRrv4OcdWpkdDC3zgoqzulqQlvHI1ooabrdIJYhkJ4TMpnTxk8QT
         4RtQ==
X-Gm-Message-State: AOJu0YxUHfSFVCQCTwwiW5/ONxOekoZCGs78uWi3gS6YlDa681h9bSdI
	0TFw2S4x65XWCEDeiKjmHKZcZ4ThmUkzvnKqY8NLxYQ06ktWmustmAK7Tj5T+jYpXpd/uk/8bXD
	jp5xQuPoIKreHKJJrC1xPIV1I1jT4CnM=
X-Gm-Gg: Acq92OGTLYnCUyIGlfVmiJ4fcOzimXvUNjLrKPb/6CxMIexeF+7ldnRxB988uGYjwIF
	Np6vmQyth0A46cMFEwFYn5qs9bzkh0vBFYQk0Gh/JcxlRqNdLj++bRXjEg3bNF1NSPs9h5An8Uf
	9iPa08osFddQLLtsMfxs4iLPoq6Y0/clsAHVA19Hy2u1BDezGQYP1qR/QVdFrw9Z3+FHvXynD/T
	P9NQu4QK2D2sEtbX8uM7+xwaGOqKmCWDln1FLWjZ6jETzl/fC6snlh0dr8H1i+l4JewrdnFp3jX
	kxns+S+UltQ8V4AeLkZ3+rRnCywS8fhVrCl5D2uOwJNgJ+Ov56qM+3Z7BjnQoLPgMmvgdo2WpZQ
	tgZK4em9nCmarKw==
X-Received: by 2002:a05:6214:29e3:b0:8ca:117c:e503 with SMTP id
 6a1803df08f44-8cee62655d1mr335055816d6.26.1781054092226; Tue, 09 Jun 2026
 18:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260609202705.183875-1-enelsonmoore@gmail.com> <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
In-Reply-To: <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 9 Jun 2026 18:14:41 -0700
X-Gm-Features: AVVi8CejiAX4BPC3WkqimUAQOP3_qmC0-30J1KdBshcdRuBOy7A00Cqo0sNyjrI
Message-ID: <CADkSEUjVYOCYDRkr+WYD34_LH=gYGRyvHfwWH6q5jPLZBtXeTA@mail.gmail.com>
To: Agatha Isabelle Moreira <code@agatha.dev>
X-Spamd-Bar: ----
X-MailFrom: enelsonmoore@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TYPYVRP33WN6AGSZWMSUX73Z4Q6KUFFI
X-Message-ID-Hash: TYPYVRP33WN6AGSZWMSUX73Z4Q6KUFFI
X-Mailman-Approved-At: Wed, 10 Jun 2026 15:56:59 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove driver depending on nonexistent config option
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TYPYVRP33WN6AGSZWMSUX73Z4Q6KUFFI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.69 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:code@agatha.dev,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:kuba@kernel.org,m:linkinjeon@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[agatha.dev:email,mail.gmail.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 076AE66B16E

SGksIEFnYXRoYSwNCg0KT24gVHVlLCBKdW4gOSwgMjAyNiBhdCA0OjU24oCvUE0gQWdhdGhhIElz
YWJlbGxlIE1vcmVpcmEgPGNvZGVAYWdhdGhhLmRldj4gd3JvdGU6DQo+IE9uIFR1ZSwgSnVuIDA5
LCAyMDI2IGF0IDAxOjI2OjU4UE0gLTA3MDAsIEV0aGFuIE5lbHNvbi1Nb29yZSB3cm90ZToNCj4g
PiBUaGUgR3JleWJ1cyBBcmNoZSBQbGF0Zm9ybSBkcml2ZXIgZGVwZW5kcyBvbiB0aGUgY29uZmln
IG9wdGlvbg0KPiA+IFVTQl9IU0lDX1VTQjM2MTMsIHdoaWNoIGhhcyBuZXZlciBleGlzdGVkIGlu
IG1haW5saW5lIExpbnV4LiBUaGVyZWZvcmUsDQo+DQo+IEFjdHVhbGx5IGl0IGRvc24ndC4gVGhl
IGBkZXBlbmRzIG9uYCBsaW5lIHNheXM6DQo+DQo+ICAgICAgZGVwZW5kcyBvbiBVU0JfSFNJQ19V
U0IzNjEzIHx8IENPTVBJTEVfVEVTVA0KPg0KPiBUaGF0J3MgYSBsb2dpY2FsIE9SIG9wZXJhdGlv
biwgaXQgZGVwZW5kcyBvbiBVU0JfSFNJQ19VU0IzNjEzIE9SDQo+IENPTVBJTEVfVEVTVC4NCg0K
VGhlIGZ1bmN0aW9uIG9mIENPTVBJTEVfVEVTVCBpcyB0byBhbGxvdyBkcml2ZXJzIHRvIGJlIGNv
bXBpbGVkIGluDQplbnZpcm9ubWVudHMgd2hlcmUgdGhleSBkbyBub3Qgd29yaywgdG8gZW5hYmxl
IGJldHRlciBjb2RlIGNvdmVyYWdlDQphbmQgZWFzaWVyIHRlc3Rpbmcgb2YgdHJlZS13aWRlIGNo
YW5nZXMgd2l0aG91dCBjcm9zcyBjb21waWxlcnMuIEl0DQpzaG91bGQgbmV2ZXIgYmUgZW5hYmxl
ZCBmb3IgcHJvZHVjdGlvbiB1c2UgY2FzZXMuIFNvIHllcywgdGVjaG5pY2FsbHksDQppdCBkb2Vz
IGRlcGVuZCBvbiBlaXRoZXIgb3B0aW9uLCBidXQgb25seSBvbiBvbmUgInJlYWwiIG9wdGlvbi4N
ClRoZXJlZm9yZSwgSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnl0aGluZyB3cm9uZyB3aXRoIHRo
ZSBjb21taXQNCm1lc3NhZ2UuDQoNCkV0aGFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
