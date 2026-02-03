Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDCjHUEqgmnFPwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 18:02:57 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B1711DC6F9
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 18:02:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C26AF3F7E9
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Feb 2026 17:02:55 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	by lists.linaro.org (Postfix) with ESMTPS id 6889D3F7E9
	for <greybus-dev@lists.linaro.org>; Tue,  3 Feb 2026 16:20:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=HSGIz9fj;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.161.48 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-662f74f653bso3257045eaf.3
        for <greybus-dev@lists.linaro.org>; Tue, 03 Feb 2026 08:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135600; cv=none;
        d=google.com; s=arc-20240605;
        b=EG8a0T+Cg/Lokuihwvp3NXhZmW5CDE/0GtWofOP5agp3EG4QcPoUGIKV9snBnTAWdL
         hx0J9Br1wdiSDtjte09480dCxB99G6UCxDBYeIJpROropgosnuNW1JppPYCPvZiQ4I16
         1BoU0k1OYGk4dl2QKDqhnuI7pc1awwvnr2G6u/01ji/ktqSiRN5TP9lhxzFpKH+3EDuR
         BpvmIKpGKXYx1atfq09MPxtK9+5fqnPGsi42YH6w0KaBqNPIfnTjnZR4QM/iwaGCk8vs
         QyROenz41fCCRWYsk2CDtuevLO8BYj1Y9Jv0mYZq+HxnMCVP7r6XuNW8aIfNHN8jBX2r
         Gtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WetA7aOWSHfDFPg5y9lxJ65X/k6to1Pjcd8Gc6hn2U4=;
        fh=d2SYdEla/I+Jw01IKffxis/zRJpcQrEcsYM0FbG0C8g=;
        b=cb9ofwdV1nU4hv34t1Q12QJJfgx+MAT8SO5QETDYX+p+I9dPlpBUqAemggs7i/oVwr
         Xlct8XcGhtiy/Ap7H6N6VpCulDiBxlcIkT3uPif4aDc2Qg6q7dl0JjzxcNXTYJdkFYuX
         NRCmTZIlLWVbTbSV7Bj87AIJ4I6WMPSqnYdS7TuqALQ6cOG5TQmhkKEpM3BXpjHAiz/k
         Y0h5WYgL708/sB74gsGQMOyQ4g9wN9f+kWGXolwZse8ad3aLW/S7Hfvn/KtCAz165msk
         w4B/65qiDPbAegqgXrT7+TaFL5UUSc/9gg/pPweP5jcvOaZONMtITER8tKHEfT0tyX0r
         lwLA==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135600; x=1770740400; darn=lists.linaro.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WetA7aOWSHfDFPg5y9lxJ65X/k6to1Pjcd8Gc6hn2U4=;
        b=HSGIz9fjmJKfmKov7tMycNtl8cSLJe7nda3KSL5cCNekHikj5+wCTvuyWFvqpt/yqB
         L+jISvpnMd0GboaH2y2VgHB249mhbH3F9UV/QmSNvNBckI6goc7Zu+nOKCI0KGsmOQWc
         0m7SZHWhIgL84nqX7j9gfKhfCgsSW2wzHWlVMqyavb1IzKPHLFE4rkxMZLRYrt1HCp1B
         whPzDs53iPlZzI/R/7mPuxgo3U4TtjBxdn6kAWNB1CvFRpBpCliAWNSA5j/aDLnL9dNi
         GVhvjd30loFgOnjHPxVht6pQZzdVLyqhPWC+OjaTjljRh2y1XnhMifm/EwlnZj6nJh+m
         F0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135600; x=1770740400;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WetA7aOWSHfDFPg5y9lxJ65X/k6to1Pjcd8Gc6hn2U4=;
        b=YRDEqUmRwSMiP558QbvNTF1Bmfbui3bSDMiezydjDToALRtpZ2PsYUDCTJug8qMRZe
         ZL1wIG5TdwvmKFalgc7tHyHffVq9+0n06vMPzHY/VJ5mLHhc8iToLO2EkCzKY0W1JxIq
         FesuS0s9UPl++mvQjHX9U7fY9QomP2EoC0q9tRyHD3UTeTVpVTgBrcnYBykASB6QspB6
         TXpAqrypF7Aebbj9FZXGp9k8o+jzpl9AXwAa+8nzSFzgffQEfsoGABoqchbLvyBzbqu8
         k0O9ngWQA3/AenEiCTfLVXLzxjIRQrx48sNMgAIzhX6Pn+RVnK2RwaC7gMiS69A0KlKT
         r69Q==
X-Gm-Message-State: AOJu0YzBP4GjCMN1xM8eV/y2JpYCvGkNBKXlyLKAeVZGHHjBmuw4RBqx
	sc4kkSTRuE/WOBQrDrDoexW/HWRwr9307eNFR2GgIfM96lv/aKFBI1E1Ai/fJVBAzEACUMQZWRq
	Ox5CerrMUljXuncOZVY4dg17YxdppuABJUErt
X-Gm-Gg: AZuq6aIoDNGPxniLV08lSssKyjupN2QsXgLV8n0FJ9M1ZbLkK+IRfnQHCj+FTh01uAc
	PUkrnYsQhGhqas3um0qOaVS1ApzNI4q5Bn1QA/Jjg1EUBOl5hVnPyJVHTq+HBS9Zs+trB9iOU06
	/6il54PagWweB/IwlEmoK87sSAri2nYsQP5cgnTNdGAvlBh/KsR6VFcEKs9PFi9esEQdulUb14B
	CD7D/mUldRuGgrY06sfojNX57NQB3ilKGp6o+oJ+fIKEMa+SZNDg+s2q/uiyiVhsDe8XugDxwr9
	Gnsm5x4/bMICyzW+1kCnRo5UcsPD
X-Received: by 2002:a05:6820:3088:b0:662:fc84:fa6b with SMTP id
 006d021491bc7-66a229791e1mr82913eaf.49.1770135599735; Tue, 03 Feb 2026
 08:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com> <20260203123209.182175-4-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-4-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:49:48 +0530
X-Gm-Features: AZwV_QixxKtScMC_6qomvBkPjkiAUAqbU_5bAORIQLIyO9k93X_c149EigcWvyA
Message-ID: <CAJH1ELCx6zamcztCVqmyrDG4uMoOM=S9Fb6resQRXZ0xrScSyQ@mail.gmail.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
X-Spamd-Bar: -----
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PYNVZDKIZ6YNDUVKZXS7UGVPO4FGJGKB
X-Message-ID-Hash: PYNVZDKIZ6YNDUVKZXS7UGVPO4FGJGKB
X-Mailman-Approved-At: Tue, 03 Feb 2026 17:02:33 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Fwd: [PATCH v2 4/4] staging: greybus: resolved checkpatch checks for light.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PYNVZDKIZ6YNDUVKZXS7UGVPO4FGJGKB/>
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: B1711DC6F9
X-Rspamd-Action: no action

LS0tLS0tLS0tLSBGb3J3YXJkZWQgbWVzc2FnZSAtLS0tLS0tLS0NCkZyb206IFJhY2hpdCBEaGFy
IDxyY2h0ZGhyQGdtYWlsLmNvbT4NCkRhdGU6IFR1ZSwgRmViIDMsIDIwMjYgYXQgNjowM+KAr1BN
DQpTdWJqZWN0OiBbUEFUQ0ggdjIgNC80XSBzdGFnaW5nOiBncmV5YnVzOiByZXNvbHZlZCBjaGVj
a3BhdGNoIGNoZWNrcyBmb3IgbGlnaHQuYw0KVG86DQpDYzogUmFjaGl0IERoYXIgPHJjaHRkaHJA
Z21haWwuY29tPiwgUnVpIE1pZ3VlbCBTaWx2YQ0KPHJtZnJmc0BnbWFpbC5jb20+LCBKb2hhbiBI
b3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+LCBBbGV4IEVsZGVyDQo8ZWxkZXJAa2VybmVsLm9yZz4s
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQoNCg0KQWRk
ZWQgY29tbWVudCB0byBtdXRleCBkZWNsYXJhdGlvbnMsIHRvIHJlc29sdmUgY2hlY2twYXRjaC5w
bCBjaGVja3MuDQoNClNpZ25lZC1vZmYtYnk6IFJhY2hpdCBEaGFyIDxyY2h0ZGhyQGdtYWlsLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMgfCA0ICsrLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2xpZ2h0LmMNCmluZGV4IGU1MDlmZGM3MTVkYi4uMWYyZmFhNmQ1NDVkIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYw0KKysrIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvbGlnaHQuYw0KQEAgLTM3LDcgKzM3LDcgQEAgc3RydWN0IGdiX2NoYW5uZWwgew0K
ICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbGVhc2luZzsNCiAgICAg
ICAgYm9vbCAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJvYmVfc3RhdGU7DQogICAgICAg
IGJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWN0aXZlOw0KLSAgICAgICBzdHJ1Y3Qg
bXV0ZXggICAgICAgICAgICAgICAgICAgIGxvY2s7DQorICAgICAgIHN0cnVjdCBtdXRleCAgICAg
ICAgICAgICAgICAgICAgbG9jazsgLyogcHJvdGVjdHMgZ2JfY2hhbm5lbC0+YWN0aXZlICovDQog
fTsNCg0KIHN0cnVjdCBnYl9saWdodCB7DQpAQCAtNTksNyArNTksNyBAQCBzdHJ1Y3QgZ2JfbGln
aHRzIHsNCiAgICAgICAgc3RydWN0IGdiX2Nvbm5lY3Rpb24gICAgKmNvbm5lY3Rpb247DQogICAg
ICAgIHU4ICAgICAgICAgICAgICAgICAgICAgIGxpZ2h0c19jb3VudDsNCiAgICAgICAgc3RydWN0
IGdiX2xpZ2h0ICAgICAgICAgKmxpZ2h0czsNCi0gICAgICAgc3RydWN0IG11dGV4ICAgICAgICAg
ICAgbGlnaHRzX2xvY2s7DQorICAgICAgIHN0cnVjdCBtdXRleCAgICAgICAgICAgIGxpZ2h0c19s
b2NrOyAvKiBwcm90ZWN0cyBnYl9saWdodHMtPmxpZ2h0cyAqLw0KIH07DQoNCiBzdGF0aWMgdm9p
ZCBnYl9saWdodHNfY2hhbm5lbF9mcmVlKHN0cnVjdCBnYl9jaGFubmVsICpjaGFubmVsKTsNCi0t
DQoyLjQzLjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMu
bGluYXJvLm9yZwo=
