Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGFeNk4Uk2nD1QEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Feb 2026 13:57:50 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE891437C6
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Feb 2026 13:57:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D6923F78B
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Feb 2026 12:57:49 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	by lists.linaro.org (Postfix) with ESMTPS id 051363F7EE
	for <greybus-dev@lists.linaro.org>; Mon, 16 Feb 2026 04:52:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=lnkupWNZ;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 74.125.82.53 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-126ea4b77adso3323768c88.1
        for <greybus-dev@lists.linaro.org>; Sun, 15 Feb 2026 20:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771217577; cv=none;
        d=google.com; s=arc-20240605;
        b=Lo09cKLYt/h4lq3AH59Oun0gW92wSY2Grwi6Ne/97ORj9cUWv7Fkv0U7Ii4FlGBNql
         /pLjYVDbD+keKQp2Mjnhry0l+BKlbd5sTykszgxAjzBBrQFlL35IBMMJ9w0s8qw7Jyy9
         fTM+2E0WQkkqs/gQHDhCrTnhgJwDfuZknR+9eLfxO8Q9FqLI3TpW+5uGyn3pyA0Ns2Ne
         GbM4aPkPII8NN+f9kfOmXrWwsD1cWF5WWsvN9K54xSUCcVeKyMs3J+Tq6crgH9zwvDhP
         mPMGUwrlWHJqICDBb9GAy/JhozgtTq4gVh/lT6DJhxw6Nwe5BhSP3lDw79v/9iMIHkr5
         oWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTccCMI5hfj8LcwdYU904F7AvHteawVNHgOX7Um48Hc=;
        fh=zKbNuArp6+zpw+T5Hk9mJA1HDoYhbcgZUBLX4vQ0Cik=;
        b=PhgNAemu5RJaV27zhnQtT9J6dTp5Y1FzYkq0K+CMiFiI9HDW+PYTQVyZvrM5sRnt/c
         Mea/SoFfN+Uqe5rAaCwgLG9xWgrNmgTDXLesxcWoy1JQMBt1gVRFHMMbINEJB867BHnd
         FgP8Z1rODJ05tpTHsKFepITLTO4E5Hv438vQ3P3pLkhhZaUuPKMnLMNWGGSuwEXp0INR
         Uz7+LrtVRvnDyKo8iswjY4QX4K8M/eBP9KZ4OosDZSyZ1agY4RXlSeQiOPvWnI4pleiZ
         ewa85j1FwkI2WV2ZJXY+KGWH4/A2qadcJiju02v62FOuTsqBpB0d5WjS3i7tiOf8RgTy
         +3Dw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771217577; x=1771822377; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTccCMI5hfj8LcwdYU904F7AvHteawVNHgOX7Um48Hc=;
        b=lnkupWNZKTpo/3XrCPaCAh98CKlyW05HaRwPju46QKaBSkhD1V6gAOp7gkQo+z5vys
         jAVXQ8ny1nOilC4xEjKax7Di09uRukMvdgr8hTKIEmsSrCkD+Lr7+vvNQzMdePJTtqMA
         x2gIjpXIMA8AvGqpwZjXyXaXL3KK60A2s/RDPn1IDfquk2BbYxec6cSVzuiaGnGbxIlB
         dlWCK8lbJg6xpFvFdtHy7ZQoR0kbqykOZkgq9s5FAJ6XKiGbC09MY6UZOu3GDEaekXPQ
         eumaGdGLUtLXi5RA4WHQsvvJONzermbOkMxttQXBSJF12GumMXSTxXaDuaeDx1RbkMpG
         tS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771217577; x=1771822377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTccCMI5hfj8LcwdYU904F7AvHteawVNHgOX7Um48Hc=;
        b=UJwp2zfCTPHRcyF0Y6c5J54NuNqot79Nn6Ix05cn8DonilTHEJRlvX9BGBe7QHKHGs
         hQuvkg9btZeDuRUfke7z4gTjM0izLQCyZYNnyRAoQYj3+SnlYV9dQ+6XHMkJaJc1Eo7+
         CWMufss3eAopFdof8Y4odGcwYwTPA3RiCcq1EReKEwzyJbAIJooMAmWSLw48QZ7ZI3Oo
         9ktrDTKuwsPA64YcZXtkW1A1EpJWqbiREzzOOWf3o6KsnHXpvQ/oJj9q0EJDyQcQgCKU
         2kjrGCJBE73mCxX4zzTmq3VzASuSqs/LuLAzHKchot+dEJgDml36x8uutacfKCLDvtnu
         U5/w==
X-Forwarded-Encrypted: i=1; AJvYcCWPpBUdVXPbOjBSZqZhENnkE44xl1ldPGZnq7S3jy9o8eGVaV6Uh7xoNt6RS/UpCnrofD169hRyrTVhVA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxwQ9YJEs/bfVPEA3I8odkXRCemNxDmrVZp+L1MuhuKSYGYc/jy
	hEP4qo8zhq21kZoTFRJyNypHA59qU+AuAmW9yeufJimCq18TceqIfgqPwTcF5G7wPLAKGUAGkgS
	oXg7+KyE6o/qsdtN4fUBA0jH7SA0/j8Y=
X-Gm-Gg: AZuq6aINr730QO7uA5sjeQeJRV0J6TK8bg1ByfLT1yNyAWPgprI8YfJ2Hl3P4H8Aq2h
	HpwZ24ZjbPcBQn2asmZkagpC15Dm07u5u76hmx/eW9MQuNZ122J/C4UBBZSwb2lzFD4dycL6LHS
	hIXNMrKl0Tgo/0Kpwz8uMGWSQd4bAq5x2chQuDTCTBH8LwqDDx5Ix6cfZHoLxjd/sq+t3Z7VAtG
	CHN1904OcVHXaivWZmV8Bm0pvligRH/xGYiC1d37LRNz+ZIof7SElkBVj5aj8ZZni2/2xZVIevm
	JskWFeW47kRhSMCGdP1h3AObUPtw52R66Z9rQ+sDsl2AC+3o/SfSqYcSEtIWiKpv
X-Received: by 2002:a05:7300:cb87:b0:2ba:81b2:7811 with SMTP id
 5a478bee46e88-2baba1471ffmr3489314eec.40.1771217576936; Sun, 15 Feb 2026
 20:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20260204183003.182728-1-rchtdhr@gmail.com> <2026020704-velocity-palpitate-afd2@gregkh>
In-Reply-To: <2026020704-velocity-palpitate-afd2@gregkh>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Mon, 16 Feb 2026 10:22:46 +0530
X-Gm-Features: AaiRm506_xdwKhH2D28TZwmImFjCHLEnEQ6v3rUoIq7gvoZd8rwauRPheZaUrHs
Message-ID: <CAJH1ELB2k_UkNW0nsH_5swy9YaZWCC6Osbq7GXnECHpepb6UHA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Spamd-Bar: -----
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GSMX373SWZDXGJAGDMYKHD6ZSNZZ7YM4
X-Message-ID-Hash: GSMX373SWZDXGJAGDMYKHD6ZSNZZ7YM4
X-Mailman-Approved-At: Mon, 16 Feb 2026 12:57:46 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/4] staging: greybus: added comment to mutex declaration in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GSMX373SWZDXGJAGDMYKHD6ZSNZZ7YM4/>
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
	R_SPF_ALLOW(-0.20)[+mx];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 6BE891437C6
X-Rspamd-Action: no action

T24gU2F0LCBGZWIgNywgMjAyNiBhdCA3OjA44oCvUE0gR3JlZyBLcm9haC1IYXJ0bWFuDQo8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPg0KPiBIb3cgZG8geW91ICJrbm93IiB0
aGF0IHRoaXMgaXMgd2hhdCBpdCBpcyBmb3I/DQo+DQo+IEZpeGluZyB0aGlzIHR5cGUgb2YgY2hl
Y2twYXRjaCB3YXJuaW5nIGlzIGhhcmQsIGFuZCByZXF1aXJlcyBsb3RzIG9mDQo+IGRvY3VtZW50
YXRpb24gYW5kIGNoZWNraW5nLiAgSWYgeW91IGRpZG4ndCB3cml0ZSB0aGUgY29kZSBvcmlnaW5h
bGx5LCBJDQo+IHdvdWxkbid0IHdvcnJ5IGFib3V0IHRoaXMgdHlwZSBvZiBpc3N1ZSBhdCBhbGws
IGl0J3MgYmVzdCBmb3IgbmV3IGNvZGUsDQo+IG5vdCBleGlzdGluZyBjb2RlLg0KDQpJIGRpZCBn
byB0aHJvdWdoIHRoZSBjb2RlIG1hbnVhbGx5LCBidXQgdW5kZXJzdGFuZCB0aGF0IGl0IG1pZ2h0
IGJlDQpkZXNlcnZpbmcgb2YgbW9yZSBleHRlbnNpdmUgY2hlY2tpbmcgYW5kIGRvY3VtZW50YXRp
b24gdG8gbWFrZQ0Kc3VjaCBhIGNvbmNsdXNpb24uDQoNClRoaXMgcGF0Y2ggY2FuIGJlIGRyb3Bw
ZWQuIExldCBtZSBrbm93IGlmIGFub3RoZXIgcGF0Y2ggc2VyaWVzIGlzDQpuZWVkZWQgd2l0aG91
dCB0aGlzIHBhdGNoIGluY2x1ZGVkIGluIGl0Lg0KDQpUaGFua3MsDQpSYWNoaXQNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
