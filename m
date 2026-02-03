Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP9QHy4qgmnFPwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 18:02:38 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB4DC6E0
	for <lists+greybus-dev@lfdr.de>; Tue, 03 Feb 2026 18:02:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E33013F91B
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Feb 2026 17:02:35 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	by lists.linaro.org (Postfix) with ESMTPS id EF9EB3F83E
	for <greybus-dev@lists.linaro.org>; Tue,  3 Feb 2026 16:19:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=CHtT11Kk;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.161.42 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1");
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6630d0685abso3079981eaf.0
        for <greybus-dev@lists.linaro.org>; Tue, 03 Feb 2026 08:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770135584; cv=none;
        d=google.com; s=arc-20240605;
        b=T02/ZyTTJtVGyvdioFvlkzy5v4VXpEjtQ0NfnpUXk+mDkmNNFQaJKf6HydaJLyRwwz
         UTxRJqfY4ExsJ04yIzSBp4FFpHuvfA1tZUW56jzXPzQLEDi8a8sJ2FceMpk6o4xJ9T1H
         vUsIflrlMP4Mzi47VYwBy6ArpYL6W5iJ2ScZKhscUJcCixl+jWVb1QcchHZYCdGn8dGW
         juZF2gkpsLwKUp0KZPM69Om7r0tOtAhTs/e24jHm1jfns5nSaVv6jRp6OKGcoH82lONQ
         pysnrkX+TaMJKzwYYwsAukr1M7AJHDFMnzJSI06yD+5NtoRwYs6FUB7PJDLm1uRVSTVY
         7ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtYsmVW0lML68ED6ROKxgb5o4nzbXwhj1MG4l/luoeA=;
        fh=d2SYdEla/I+Jw01IKffxis/zRJpcQrEcsYM0FbG0C8g=;
        b=VhEIvhw5+nIvH0DXX7XyztPgBdbV4jy94PRZmJsybGTtx2ogcMaKWi+PD+rH4CAPoM
         Ryer/lt4C6S4bG6adtEG1JdX+XD0YY+ENRklsSpSMBVfg5qSkly6kK/d4KBgGv9z2KpU
         xYTUbJyLULZC+z+IM62zIAbjZ4oror9RmjhIpNImUdB3u8OIcUjE8AGJhhEEKnsSOUvQ
         RtFGQheHARwFjOnHE+203hyv2gWK1Srq2uk6oCrYqrBbngTe+SE816FML1SJ7w5U/Pwp
         23E7ladzy9XZS9Sn8tWS1lpIGgu9AtVDHut6DsF2L2m+IYpThGjObMMGBCwx6AL/5QbQ
         wFPQ==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770135584; x=1770740384; darn=lists.linaro.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtYsmVW0lML68ED6ROKxgb5o4nzbXwhj1MG4l/luoeA=;
        b=CHtT11KkUaiFNCzvUtxh32j3+DF6j47GTWjrOgZxGF7i9XWq8hwDfq6ZILeh0nOSTx
         D/qS1qpltl5/8NUf0W9OQAlR3JX5aCYel0FeB6kfd3qrSuE1yk68r7l1jgRzi2/iAQJJ
         Q8Y+w5YiRN8IRbffxx7jk5EosWpGqkyS00NVkFoCl4WvqsZGsUOi8mpwbK896iY9U4HB
         zzBSndlzsYJ9aygVhwAgniLlnxYIF8aSrDsPDtQCr/nsVC9qdBQB90ibcW83MrsZ5VGq
         7rcgSHbIeqEZ3laRNa4ltxN8F8QOsZAbFgSVD4AoF3OBF57d5yDpzugULrgIXhfJ3pNQ
         UMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135584; x=1770740384;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtYsmVW0lML68ED6ROKxgb5o4nzbXwhj1MG4l/luoeA=;
        b=c0XyWk/7zZaXOeByfo0sLLtENigNJJGkTkQpVDG//D62kQy4oMOWecH5hWbc7fvqWs
         8rwuRj00Q15SblorQEeLv/os0Wc6SnpBLNMdWOUqWim5FQCwUmTe/4bLRN+uI5vtpIpH
         2DUJYpfGNH8WphvjvLuBJv7gHVRv6I1YjHH1zDWgldDkSJWF5eh2PZgNbMpz0V441IPe
         jLFxPVhOR2IWok/WWO5wFHXRrRNsP4FFOri1TprSsgzGlLPfleqsigLDCfRy2e4ku+Ly
         g/3qOGqCGXLZtKrtrh21kW30Ho7RYOMzUTg5niFmsZeqbJQyeMj229diyLQv/HtyWAbi
         W2CQ==
X-Gm-Message-State: AOJu0Yz6WwbwALXojJ/TZ27dzzCfQs1BLzt3N43+ALozRg87ykYnliyc
	khPT7BgGRQ34vmKH15h9SXiULtPM2qn8iBRs9/1H0Af6X5yWNoTcPQK5mAe25RsoTKRZW3DK9qK
	zlWMXtype/cPUoYY4uZyi+SJB7rT+/J4SCJi4
X-Gm-Gg: AZuq6aJzlRYf3XPw9+q4rUSqJ3sbznhWk2kNcrc0mA0gU28minOA3UdjD4/xXHBQNyt
	iKMBH+4m6KmeiHoAREsjwS2+JjxXszdpqO0lvscaBom4M0M5dLdOtII5Xz7dXUMUuXb8A4H+Uok
	zRsQ6UOEZxN5JrMgchc4Uqn+Y6yDMtWc59geS2wddSDU970IHDnGxGBXIXFPdfwgsslWvuOSE5s
	MBAdRdwawffcU2hIke21kT1zQyyl71PXUWPKM9ERB450/HJ54RKH/3X6cV37RXLt6Fk7hxS8GBC
	LjvotUzJHlIMIkeihAX/Pc1BgphR
X-Received: by 2002:a05:6820:3101:b0:65d:33de:1c56 with SMTP id
 006d021491bc7-66a234318ddmr78957eaf.64.1770135584203; Tue, 03 Feb 2026
 08:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20260203123209.182175-1-rchtdhr@gmail.com> <20260203123209.182175-3-rchtdhr@gmail.com>
In-Reply-To: <20260203123209.182175-3-rchtdhr@gmail.com>
From: Rachit Dhar <rchtdhr@gmail.com>
Date: Tue, 3 Feb 2026 21:49:31 +0530
X-Gm-Features: AZwV_QhCX4gjFHXEKHhIJ5qwUonHSP9jQy6b6lGB5pLrdkOIygmQw7n0N5iuSFQ
Message-ID: <CAJH1ELCE5=hgq-iTc1xr=Wk0_emDLMfq0ampf9kdf5Ee4Rwbgg@mail.gmail.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
X-Spamd-Bar: -----
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KEGPT2YNCJLE3G7WBEE6IDFEB662EXEF
X-Message-ID-Hash: KEGPT2YNCJLE3G7WBEE6IDFEB662EXEF
X-Mailman-Approved-At: Tue, 03 Feb 2026 17:02:32 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Fwd: [PATCH v2 3/4] staging: greybus: resolved checkpatch checks for raw.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KEGPT2YNCJLE3G7WBEE6IDFEB662EXEF/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 50AB4DC6E0
X-Rspamd-Action: no action

LS0tLS0tLS0tLSBGb3J3YXJkZWQgbWVzc2FnZSAtLS0tLS0tLS0NCkZyb206IFJhY2hpdCBEaGFy
IDxyY2h0ZGhyQGdtYWlsLmNvbT4NCkRhdGU6IFR1ZSwgRmViIDMsIDIwMjYgYXQgNjowMuKAr1BN
DQpTdWJqZWN0OiBbUEFUQ0ggdjIgMy80XSBzdGFnaW5nOiBncmV5YnVzOiByZXNvbHZlZCBjaGVj
a3BhdGNoIGNoZWNrcyBmb3IgcmF3LmMNClRvOg0KQ2M6IFJhY2hpdCBEaGFyIDxyY2h0ZGhyQGdt
YWlsLmNvbT4sIEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4sDQpBbGV4IEVsZGVyIDxl
bGRlckBrZXJuZWwub3JnPiwgR3JlZyBLcm9haC1IYXJ0bWFuDQo8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+DQoNCg0KQWRkZWQgY29tbWVudCB0byBtdXRleCBkZWNsYXJhdGlvbiwgdG8gcmVz
b2x2ZSBjaGVja3BhdGNoLnBsIGNoZWNrLg0KDQpTaWduZWQtb2ZmLWJ5OiBSYWNoaXQgRGhhciA8
cmNodGRockBnbWFpbC5jb20+DQotLS0NCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYyB8
IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvcmF3LmMNCmluZGV4IDcxZGU2Nzc2NzM5Yy4uNGYyMTdmMjBmMWMwIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMNCisrKyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Jhdy5jDQpAQCAtMjAsNyArMjAsNyBAQCBzdHJ1Y3QgZ2JfcmF3IHsNCg0K
ICAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7DQogICAgICAgIGludCBsaXN0X2RhdGE7DQot
ICAgICAgIHN0cnVjdCBtdXRleCBsaXN0X2xvY2s7DQorICAgICAgIHN0cnVjdCBtdXRleCBsaXN0
X2xvY2s7IC8qIHByb3RlY3RzIGdiX3Jhdy0+bGlzdCBhbmQNCmdiX3Jhdy0+bGlzdF9kYXRhICov
DQogICAgICAgIGRldl90IGRldjsNCiAgICAgICAgc3RydWN0IGNkZXYgY2RldjsNCiAgICAgICAg
c3RydWN0IGRldmljZSAqZGV2aWNlOw0KLS0NCjIuNDMuMA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0
byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
