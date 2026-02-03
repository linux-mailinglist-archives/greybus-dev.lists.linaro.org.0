Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOQYFhUggmlIPgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 17:19:33 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E5955DBD02
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 17:19:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 01DFF3F83E
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Feb 2026 16:19:32 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	by lists.linaro.org (Postfix) with ESMTPS id 8F4143F795
	for <greybus-dev@lists.linaro.org>; Tue,  3 Feb 2026 16:19:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="J/RY/2bo";
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.160.42 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4042905015cso3709000fac.0
        for <greybus-dev@lists.linaro.org>; Tue, 03 Feb 2026 08:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135547; cv=none;
        d=google.com; s=arc-20240605;
        b=LcPsEPsbsVFFoy+Jrjauwl6F2gfg60Vt0j9EMk8WSc8FBCGrQbeAcw3cE72H1RD+H5
         s60qKgI/cDheyCTeYs8qAdIkwFK66zhapSlvCGhQElOHCTi/1hfS9vKxIGsLh5sOjhzm
         etbmp3YHeTsGwXeSvLaElVeF671L2Fz9/GeA+5BD2jsueZvnPWngrvK+qGXZ+0HTaqQv
         NGe+ysV3A+Gz1K0Pic8gHLuf8pfnDFGqU16nNFzb95DCWoCl9IO7K0R5EgZgeMGW7aSw
         NKmiWVC+ksErSh1RKVQjE6+VO264f1CGPmFFOORfp5mn4Y0JXXDdqDs3LUAsmyB6t7Cd
         7CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NWWbEbxK1poqIotDvk6UrXputXw4PUznJR4lzGaxAy0=;
        fh=d2SYdEla/I+Jw01IKffxis/zRJpcQrEcsYM0FbG0C8g=;
        b=kLQc20ECmwH/9ijh7QWzrVkzKQXje6wJwWH1vuzWCTmHNfBm+Orrgts/2+fR8arSzX
         Z9zvQnMJgEfTdwbSAP2ZOSAALMPQVd2LuRHyB+FyEk0hVu2dZGQIv4qdvFM79J6LFgW6
         FZ8F8yZj1IhZC962wYUysPNa0net0WqikZ4gY0XChi8rlIPyV4Cv2rKw4tznJvIO4ILK
         SeUG7IlM61RlBs+BMF25zQkxJDQoMIX+JqaS5hBBEQgeJioX8JMeau/RA5L5EUYWbTS6
         lHKG+McHinRlG0XE/3Nga8G2GQVnT7rmRLhojSEMspKxcHkG7z5hWhhCYeIWUg2mkthO
         thWw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135547; x=1770740347; darn=lists.linaro.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWWbEbxK1poqIotDvk6UrXputXw4PUznJR4lzGaxAy0=;
        b=J/RY/2bokz2WYc0EiLU8uOeHLaJHf+tGwzyw/ZpLVbfBKYEFsTSo6p0voSmw4sCxOA
         mURZcaU++PLPQVvm2DxyyalDSwso2+JE8/cNY2dPMJkoLecx3hyfSnKUcym+vyY9ySy3
         zaV2zFVIEkvlOm1LUEV0Teg5eRxQadaqINvgbwSJBVboC6eAut88fzIqwE1OmYx1DWYj
         HO8H0XlhiwM+K9hyoVNrIWrUMI10t7Jqk0hUQhfbLy1aQFzOmvvjkNeIcFxLzAAyu8/U
         MhiFv0Go57uBBwQyibEtLQyJtxYgikbcpIja+UsvUYRZCb4v4M+VlVreZPItJdUmSJV3
         YFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135547; x=1770740347;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NWWbEbxK1poqIotDvk6UrXputXw4PUznJR4lzGaxAy0=;
        b=b0au4OuzOAasIvq2mwIYgMhUat7wMUU2ubfoar87Sa41fAd61AxOMas0hCjVQ/1pzw
         LaUkCFaXVkl603LXFoodS1KLCG0HCTVX4OX+fOh8pI1CKNpufNvOxdMxvFGhmchh4JmO
         NJcTpGjd7vY6CBGrvHFJXiCeEYqUHC1HZFOvL1P9ydbfImLusBMHFMwIicjKICIDlN4B
         o+dr3BhP0OQ4xD2HnPCueeDEsr0AQKIKf/BeJr2bev3c0VCdoXXpQ09aoY5dL4urjZUR
         MNLpb/scs6DCp2LlfUk/y68fO3Ya/uuGWXdD/8Lp8ISz4v7uKBTLRcogzALDSsMXoiSb
         kTTg==
X-Gm-Message-State: AOJu0YyUdNSXVDRxC82SGPSTq0nIT+yLoarPoJBtpM3cM08/wG7sAUSK
	1QQiGlFHPUJUAS6rcCB/WzQFHRyikTAY7LEZqRQUtopujaOk3AEknWLfthU8MBen+Ls1FXcuVbK
	E9Pkr1dJdn5VaCO32n0bHsmfmA314QORqYzA0
X-Gm-Gg: AZuq6aJvupXfOMzS2X7bDPBtlntdcLEyZ26k9IKxsRlaq7Fte1n2i8QTYI9PgOBnkzT
	NK6FLtHzbs8lMdt/kXSuxG8/bNmGNTH2CzfF0EBSZhLFEKRYqK/H1Rds5QeqikYgakhdach91aZ
	C4KymaMrLJQpt7j6F4XOF4NaCmQhhXa4houXPp6DEssmdClPjb8iuW/41FFQNRe6xuS1/NbX/q/
	xMegTNkMJbq+mdhnFxGWGPfqkIdyPFENxxZHcM87LaElVuDJ8vFhZ5v6DciKwmh8HEDuQWjqA+r
	zWUr0si+1xLmWj5pFxV+TOVifPSAPt8u4sxEBkw=
X-Received: by 2002:a05:6820:1c88:b0:663:1239:9eaf with SMTP id
 006d021491bc7-66a20e5a319mr84826eaf.31.1770135546839; Tue, 03 Feb 2026
 08:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com> <20260203123209.182175-2-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-2-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:48:54 +0530
X-Gm-Features: AZwV_QgVtz3x-9U5iW7yjuquQo8zExZHQ0k8bTICKHm7ezSp1cGJ-zO-8pgnZas
Message-ID: <CAJH1ELDk=XGwisqZMS5Y7cMHMRGZqRGKveHYfLqJsXGTwNL_HQ@mail.gmail.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
X-Spamd-Bar: -----
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JSL7U2SGMQC7HB6PXGNLOBFNRNULBZXP
X-Message-ID-Hash: JSL7U2SGMQC7HB6PXGNLOBFNRNULBZXP
X-Mailman-Approved-At: Tue, 03 Feb 2026 16:19:25 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Fwd: [PATCH v2 2/4] staging: greybus: fixed styling issue in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JSL7U2SGMQC7HB6PXGNLOBFNRNULBZXP/>
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
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,mail.gmail.com:mid,checkpatch.pl:url]
X-Rspamd-Queue-Id: E5955DBD02
X-Rspamd-Action: no action

LS0tLS0tLS0tLSBGb3J3YXJkZWQgbWVzc2FnZSAtLS0tLS0tLS0NCkZyb206IFJhY2hpdCBEaGFy
IDxyY2h0ZGhyQGdtYWlsLmNvbT4NCkRhdGU6IFR1ZSwgRmViIDMsIDIwMjYgYXQgNjowMuKAr1BN
DQpTdWJqZWN0OiBbUEFUQ0ggdjIgMi80XSBzdGFnaW5nOiBncmV5YnVzOiBmaXhlZCBzdHlsaW5n
IGlzc3VlIGluIGZ3LW1hbmFnZW1lbnQuYw0KVG86DQpDYzogUmFjaGl0IERoYXIgPHJjaHRkaHJA
Z21haWwuY29tPiwgVmlyZXNoIEt1bWFyDQo8dmlyZXNoa0BrZXJuZWwub3JnPiwgSm9oYW4gSG92
b2xkIDxqb2hhbkBrZXJuZWwub3JnPiwgQWxleCBFbGRlcg0KPGVsZGVyQGtlcm5lbC5vcmc+LCBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KDQoNCkZpeGVk
IGEgc3R5bGluZyBpc3N1ZSBoaWdobGlnaHRlZCBieSBjaGVja3BhdGNoLnBsLg0KDQpTaWduZWQt
b2ZmLWJ5OiBSYWNoaXQgRGhhciA8cmNodGRockBnbWFpbC5jb20+DQotLS0NCiBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9mdy1tYW5hZ2VtZW50LmMgfCAzICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2Z3LW1hbmFnZW1lbnQuYw0KYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9m
dy1tYW5hZ2VtZW50LmMNCmluZGV4IDA3YTBlNmI2M2NmMy4uY2Y5MTdkZGI3OWM0IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctbWFuYWdlbWVudC5jDQorKysgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9mdy1tYW5hZ2VtZW50LmMNCkBAIC00MzQsNyArNDM0LDggQEAg
c3RhdGljIGludCBmd19tZ210X2lvY3RsKHN0cnVjdCBmd19tZ210ICpmd19tZ210LA0KdW5zaWdu
ZWQgaW50IGNtZCwNCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOw0KDQog
ICAgICAgICAgICAgICAgcmV0ID0gZndfbWdtdF9sb2FkX2FuZF92YWxpZGF0ZV9vcGVyYXRpb24o
ZndfbWdtdCwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50Zl9sb2FkLmxvYWRf
bWV0aG9kLCBpbnRmX2xvYWQuZmlybXdhcmVfdGFnKTsNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRmX2xvYWQubG9hZF9tZXRob2Qs
DQorDQppbnRmX2xvYWQuZmlybXdhcmVfdGFnKTsNCiAgICAgICAgICAgICAgICBpZiAocmV0KQ0K
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCg0KLS0NCjIuNDMuMA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
