Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBTxDFMUk2nD1QEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Feb 2026 13:57:55 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491B1437D5
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Feb 2026 13:57:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0DFDE3F78B
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Feb 2026 12:57:54 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	by lists.linaro.org (Postfix) with ESMTPS id F3EFD3F7EE
	for <greybus-dev@lists.linaro.org>; Mon, 16 Feb 2026 05:04:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EfRNjhdJ;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 74.125.82.47 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124afd03fd1so4088105c88.0
        for <greybus-dev@lists.linaro.org>; Sun, 15 Feb 2026 21:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771218251; cv=none;
        d=google.com; s=arc-20240605;
        b=RAoGqi6/y3irx8uhvY0GTn/V1ceHRl41kMWS9bwhzVYYV8zPqXp1j4kOGg9+9id4el
         Kw26DUR2Sz3dufGxccBFnhRHmsn1QceknUIdrRKUqv7C3iEOZ6RWZ19+iUmLX6uS8fTf
         ZnwKhdc0Me16P86PoqEy6xnibkpBSwZQbYMI6BP6ijeoOUKbeUDfI33DYnjPoauB7PdJ
         RmycNZDk+4KL7aVAk88Wn4eVbi1GqO2kvGeqcH9GTgv7qEw+tkLSUJ7PFXPkBB7hWn+z
         0wNHrGy1VSv/6hOwtyx0r2PGqIiJUna8cYqDeAqf0dHaCd9s0T1jmVild5q1AtsBl/1o
         u5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3nEvUBQpGt7TgPbViNAbrgOhYGBJeReReSUJUzf2nQ=;
        fh=lIBqWH5cLnwODhVO1dCLSASmcUMxw0BRWHvhiVWEM00=;
        b=HwCTTyc6qW7GRnJtMoz2F/UMLMsh27qwXN9iN96tA616c7wkQfmgQtm37W/QqeNL8r
         9WwpUxSvJ4oRP2fAOnzCs5899sfZEttTM6BRs45SeDmfzF1JUzU5ajm2JNoSQyY4QAD1
         7SzJjw70IYMJS73sd5AtzGEzoSHDNKvZa89Ta3k8+Xe0pxOfSfSfAlRToUpwuED7PGQQ
         bmFoQvmv0juk1M31yq1KrYa71ayHgqH3gI4GJkuPqPmpttJLBa2/+f5RVnlyhpgxODVT
         DD4lCiLdXwTGQZkxGb1Ug+D8s7R9Ynm0jMI9vPDS3xXqNbqMvQLWJJeEZmgwb8dcZ9cJ
         lMaQ==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771218251; x=1771823051; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3nEvUBQpGt7TgPbViNAbrgOhYGBJeReReSUJUzf2nQ=;
        b=EfRNjhdJ9w73m7jtISlaFNxlhb9/z0Ki9+zyTVkSjNiC6nW0uhhOO/lDxsPENkKLzQ
         znfrFlivPIKxa/MfdAELa9DIccftLNYj19nK+om6v/p/kVPgR1AAcksjzEKpbMIJoqoS
         Mx/WY935BrGEqP3Q2mCZveoVit7I8q6moEMSQhWqLMX+/zuHPgsOlEHD2egBFYW8dKGe
         Zm4G1hxE/ftaorXlJAhKNy34yhlVK6CVEcjyxEz2h1j1X0fHNAAx4r90eFUb+N5qLe+8
         nGGzIK8/xVYINNRIrXqnx/yNXu5EllGdUw0IN1H+/3/QaZRpYedmiTmWTuJGZi5HxifE
         lXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771218251; x=1771823051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3nEvUBQpGt7TgPbViNAbrgOhYGBJeReReSUJUzf2nQ=;
        b=WzCH7gN6pVhNe4QmrewoHsYyujX/RJ12kANUnNniYIYGXqIq64CXAjTfeNU/RJ/izV
         RJhBodxM7By2BEiROb1V7m4O3MD0kix3K2UeOpb8t7GZVZK5jlgZTNV8soP8WCfsc+Oi
         R/b2xUu40Yp/NFiH3iLnlSNgB4O9IFUIb4Xendm/nGk9QFcCjemuQbCljkqSSPgcr/Ri
         896VEfefsLhlxS+P593LW0XtO78jRY1RBnGa8F0a5C5eukGXSLIrY/MrzaYBpcR4bcMd
         uJuOOoVcDWXdd4yHAgKYPEUg5yc+unk13IXR2dNciyQ9++CZZL5o4oeqnWXDslr3JiKl
         wJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoUDbSmH21mFILeSKowpCilupfFai7qLfvQZiZHXP4xGYLlgBztmdcIpVZjmk+d6h+Z3AubM1duemOKg==@lists.linaro.org
X-Gm-Message-State: AOJu0YweE0TC0qKfjaIPleWqtR5VnSLEBeg3picKUW7M4gpQ75CoPwzS
	fW1yqRWkkk57Wit47xFUcVknfFf0AVAje2m4LHhpdbukMhWYab1JNxIdqfCh8huyFREZvmCbnPw
	eAb2QKrFBM70igBPVksSus0d+UhxY1a4=
X-Gm-Gg: AZuq6aIwl5ilqWbdcwRA7qoGwdGnoueGD8ubGEWAe37dIk+7VRToy7Pn2WZtBBrnk2U
	stRhZMAbf0LhiKNuOoPfB5SbbqEM/+lTdIW1OFGYbk+LDeDllFOUqn09IQAbZncyX7N0FOJfMUn
	vHUSOEIwHsP+0uPv8KM2C0JipK7MYKvcNln+xgHuqBjRpdDh4yHVSKZH3zh7ImMUr8uXZIJVNfV
	ibf1Fd/S0kcDQtbi0RqvLnlOzoGwCriIyg8FWYdf7Gd1tM8eNCmuyiho7g/5vTOGSEilkClac8y
	ym6KyfwiD8PdFlBon1DjNs0HtCTSzyeVkMMpORZzpr8tTZg9Diwl2WWqaMvRYtkz
X-Received: by 2002:a05:7022:698d:b0:123:2d00:1668 with SMTP id
 a92af1059eb24-12741be513bmr3050148c88.49.1771218250917; Sun, 15 Feb 2026
 21:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20260204183033.182747-1-rchtdhr@gmail.com> <2026020714-tightness-atonable-8a17@gregkh>
In-Reply-To: <2026020714-tightness-atonable-8a17@gregkh>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Mon, 16 Feb 2026 10:33:59 +0530
X-Gm-Features: AaiRm50bZXn_jW7aisr3FNiN1B3kMc-JleUusT9dOJELqOyAttucPwk81Q5Yi9E
Message-ID: <CAJH1ELAO0VXJUC5s8W6KhVO4=4BA_ir94KDte+V87Vt-Sq6Ykw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spamd-Bar: -----
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 36KVGGXD6ONAJOXEQ7RF3AXKVPBDQP7P
X-Message-ID-Hash: 36KVGGXD6ONAJOXEQ7RF3AXKVPBDQP7P
X-Mailman-Approved-At: Mon, 16 Feb 2026 12:57:46 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/4] staging: greybus: fixed styling issue in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/36KVGGXD6ONAJOXEQ7RF3AXKVPBDQP7P/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,linaro.org:email]
X-Rspamd-Queue-Id: 1491B1437D5
X-Rspamd-Action: no action

T24gU2F0LCBGZWIgNywgMjAyNiBhdCA3OjA44oCvUE0gR3JlZyBLcm9haC1IYXJ0bWFuDQo8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPg0KPiBXaGF0IHNwZWNpZmljIHN0eWxl
IGlzc3VlIHdhcyBmaXhlZD8gIFBsZWFzZSBiZSBzcGVjaWZpYy4NCj4NCj4gQWxzbywgeW91ciBw
YXRjaGVzIHdlcmUgbm90IGNvcnJlY3RseSBsaW5rZWQgdG9nZXRoZXIuICBQbGVhc2UgdXNlDQo+
IHNvbWV0aGluZyBsaWtlICdnaXQgc2VuZC1lbWFpbCcgdG8gc2VuZCB0aGVtIGFsbCBhdCBvbmNl
LiAgT3RoZXJ3aXNlDQo+IHRoZXkgZ2V0IGxvc3QgYW5kIG91dC1vZi1vcmRlciBhcyB5b3UgY2Fu
IHNlZSBpbiB0aGUgZW1haWwgYXJjaGl2ZXMgb24NCj4gbG9yZS5rZXJuZWwub3JnLg0KDQpUaGUg
c3R5bGUgaXNzdWUgZml4ZWQgd2FzIGZvciB0aGUgZm9sbG93aW5nIGNoZWNrcGF0Y2ggY2hlY2s6
DQoNCkNIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMNCiM0Mzc6
IEZJTEU6IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LW1hbmFnZW1lbnQuYzo0Mzc6DQorICAg
ICAgICAgICAgICAgcmV0ID0gZndfbWdtdF9sb2FkX2FuZF92YWxpZGF0ZV9vcGVyYXRpb24oZndf
bWdtdCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50Zl9sb2FkLmxvYWRfbWV0
aG9kLCBpbnRmX2xvYWQuZmlybXdhcmVfdGFnKTsNCg0KVGhhbmtzIGZvciBwb2ludGluZyBvdXQg
dGhlIGlzc3VlIG9mIG91dC1vZi1vcmRlciBwYXRjaGVzLg0KSSBkaWQgdXNlIGdpdCBzZW5kLWVt
YWlsLCBidXQgZGlkIHNvIGZvciBlYWNoIHBhdGNoIHNlcGFyYXRlbHksDQp3aGljaCBtaWdodCBo
YXZlIGxlZCB0byB0aGlzLiBJZiBJIHNob3VsZCBzZW5kIGFub3RoZXIgcGF0Y2ggc2VyaWVzDQp0
byBjb3JyZWN0IHRoaXMsIHBsZWFzZSBsZXQgbWUga25vdy4NCg0KVGhhbmtzLA0KUmFjaGl0DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNj
cmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
