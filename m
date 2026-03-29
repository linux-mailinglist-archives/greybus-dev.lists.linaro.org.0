Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DZoGLpayWmvxgUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 19:00:42 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381635331D
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 19:00:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2C7434043C
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 17:00:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	by lists.linaro.org (Postfix) with ESMTPS id 79733402F5
	for <greybus-dev@lists.linaro.org>; Sun, 29 Mar 2026 01:35:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="VjEGgfZ/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of lorencoom@gmail.com designates 209.85.215.171 as permitted sender) smtp.mailfrom=lorencoom@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c73ba417c6eso1260960a12.3
        for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2026 18:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774748138; cv=none;
        d=google.com; s=arc-20240605;
        b=dfVtCrrcLK7AZ25HuCvJpSVwRV+OQXegoPsP8TAaGBe3qa4z4orG8H3Rqqv1Oe1AUq
         zrJ+kwMJdBaS0yIlRc6ILv4IanqW7PKEy9rXmF8krwCk/STnxERElX1eEgNVZtRJHGJk
         Hmdw+DeJS45H6AHWNXqdnQ18xV6r9HtLRDNewK5WnlU/O4iWAsWnswDs3TjmVkmZhwAS
         W+C8Rq0GzSfIzOBPSNACjwqdZNN/TDnG4EgOQW9g7+eTyyLjx5u1AO363u1UC1Vi5ElJ
         Yu97R5ckQTriDMv4NL4x1U6p/qOg6nCQ4bHJTSy0jNZJn9szNU6NrrWeIZ9IxvU6hJtx
         dsTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qFmNYa03oExeTuf0igIV47XIxP6tDZA+yOw6PxTECss=;
        fh=ID3x9FyJmTpBJWs6QTvoxwXNDFFj7XWSbQSC0BIwJ4M=;
        b=eCJD+dFHii/wPmLoxRvQ0DEafVKUXq5NTpsvT/txaEOcsbPJzzZEHbMJcH2mkkq+6X
         yoCMpky/Yc4EJcY8EvC/IMDe2p5Lx9EOuIeO65axS06DLBtcQNirm+jNL0WnC8wq8Kd1
         fFbQ+aQ0f/1dDOrmJZ0ezBC88SLP2JD9G20qtRLK9zUPO+Vxhw5NiQexbLqhdIe4b/rT
         XjDGKx1+BIM1d90PMcqIRHRsZ8IBp4NftYcRxZ/GDXUmOtxA0QdtkQSYRGJRroRL4RFh
         raDrsAPfy1gjj+SpW3XKOIgnpz2YXhWj6NkZkqCL8qMvaxOR7Jn3Ka3en1L3KF7qud+J
         QFdw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774748138; x=1775352938; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qFmNYa03oExeTuf0igIV47XIxP6tDZA+yOw6PxTECss=;
        b=VjEGgfZ/6tVgse0gDzXAXwOM6XB+BKZEHkO2mEt17R2WfN8/gTuUQXAoZFLqs7u5dB
         UOGZ6EU+WcVTPv+wvOMbWd/RbLO/5ycFtEVxCs+NEHL1z3HdVjmp451GY2dsLNMSUbv7
         byixTWbIlep0dDMUwE82BHrzI3QuKNdluxvGHbze8hrujVyyC5/uEU3i4IDNn6n3EhiM
         NzdQJHwszMl8Raa4afYn/L9z/aWgFdA5DhVdNP068t1moVBf/1xn0VA+wAjOThBe4dqk
         Is6DVKwR3ig9xTKjlHBRbXHPKaAN9SOdbulMxYrfnkv94XljMB2ZG32xa1VNljecu8uZ
         6e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774748138; x=1775352938;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFmNYa03oExeTuf0igIV47XIxP6tDZA+yOw6PxTECss=;
        b=Xr3/aAsHxpcDFg6xuo+aZjWf20eFun0cDGxlSa7I9jLgGsb8Pq0YWekAmyEDfRnhdW
         jy5gQFsBjMUJ37+7ZKTT1EA65bw003LiYor+iijGJEQOuLRrxHCvewK2C1kteoeGF2U5
         Z7M1cUAVy1uUEnOT/txVcBo0nA5PPQ6rhA6cCu6cbjC7fAIG+JbF9I7mEDhmrWBPC4ag
         Nxb6hUmd2844c8OJYn0U2mPwqGKnLEPWsK+zTCIYJJpvzwmNd4ygK+KMKqgvrnp0QRPI
         9iaH+vK5gSzu+3YvJHasUu99xL8k2G8C2HKJ1is3/8pDxwYKegLKDsczRaZsZaRFSIqZ
         Ms3A==
X-Forwarded-Encrypted: i=1; AJvYcCXmbKarOyghEvEMoMTy6b4/35kKFVp3etPG67H07xGUDJ+NRVpoGDs4aIc/gfiaXmDFlTMCsZTcwE/Vdg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx2Ql88dHtGeHoEVhUEevUKI6nG+JxgMXea1dq4JMIMdwjv9kZH
	xpv0QA8DQ5509xmGvvBQVqdroU13DircIpCeFHy6mx6J2nbEWxvMXTuCK9yM6N50kQf87USwYl+
	+tdz2IQBQZ/5g6tGhyBbNOBEsKDTliVA=
X-Gm-Gg: ATEYQzzIhyiqELhqVOhvI8nQBxLa/jXf16rq2LO0WVYdgXUtJYA94geP2l/zN1AVMw/
	rcdsZy6sQ7t3ITECryt9tM7x680oSc+UVFwcJVFgWraKOdys8R6qhU2YvRx/qbSgqg7Tn0eYeO8
	gqbgFeatWZFXVXsfVuwOVp42wb8Ct53XIK591vZBD50jlNVbY3b0hey2U8U+3Fb6dq9IPphbAAQ
	PiPJxxedAlBo0UJ0Df+GkkwcFC0ZnawgOVsJuMI7PJQnpJhsfQjbz2+1IfxXYZWhabBZW/lkWk8
	AIOsymA=
X-Received: by 2002:a17:903:98f:b0:2b0:6cb5:c6c5 with SMTP id
 d9443c01a7336-2b0cdd44b5fmr83331435ad.49.1774748138597; Sat, 28 Mar 2026
 18:35:38 -0700 (PDT)
MIME-Version: 1.0
From: loren coomer <lorencoom@gmail.com>
Date: Sat, 28 Mar 2026 18:35:26 -0700
X-Gm-Features: AQROBzCqIoZi7roP4TQZgqZBZXXbQiO4rpgkGcKQOkFO0VH1fyc9Ot4925JzDc8
Message-ID: <CALKC8YE-4J=6YfNdZq9AK-PQpjLXh3e322J0-Lg0sT4mCcc0dw@mail.gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000005dfc6f064e1fc0da"
X-Spamd-Bar: ---
X-MailFrom: lorencoom@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 33OKLFORS5HKDXE4BLUWVLMK3PDDCAP4
X-Message-ID-Hash: 33OKLFORS5HKDXE4BLUWVLMK3PDDCAP4
X-Mailman-Approved-At: Sun, 29 Mar 2026 17:00:30 +0000
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus/uart: fix misaligned wait_for_completion_timeout
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/33OKLFORS5HKDXE4BLUWVLMK3PDDCAP4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
X-Spamd-Result: default: False [2.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+,5:+];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorencoom@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 1381635331D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--0000000000005dfc6f064e1fc0da
Content-Type: multipart/alternative; boundary="0000000000005dfc6e064e1fc0d8"

--0000000000005dfc6e064e1fc0d8
Content-Type: text/plain; charset="UTF-8"

Align the second line of wait_for_completion_timeout() with the
opening parenthesis.

Signed-off-by: Loren Coomer <lorencoom@gmail.com>

--0000000000005dfc6e064e1fc0d8
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Align the second line of wait_for_completion_timeout() with the<br>opening parenthesis.<br><br>Signed-off-by: Loren Coomer &lt;<a href="mailto:lorencoom@gmail.com">lorencoom@gmail.com</a>&gt;</div>

--0000000000005dfc6e064e1fc0d8--

--0000000000005dfc6f064e1fc0da
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-greybus-uart-fix-misaligned-wait_for_completion_time.patch"
Content-Disposition: attachment;
	filename="0001-greybus-uart-fix-misaligned-wait_for_completion_time.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mnb35kot0>
X-Attachment-Id: f_mnb35kot0

RnJvbSBlZjg1MzIzNWYzYTdhNmRkYWUxZGNlM2I3MmRjYTE4NDg4YjJkYjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBsb3Jjb29tZXIgPGxvcmVuY29vbUBnbWFpbC5jb20+CkRhdGU6
IFNhdCwgMjggTWFyIDIwMjYgMTg6MjM6MzAgLTA3MDAKU3ViamVjdDogW1BBVENIXSBncmV5YnVz
L3VhcnQ6IGZpeCBtaXNhbGlnbmVkIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dAoKYWxpZ24g
dGhlIHNlY29uZCBsaW5lIG9mIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpIHdpdGggdGhl
IG9wZW5pbmcgcGFyZW50aGVzaXMKClNpZ25lZC1vZmYtYnk6IExvcmVuIENvb21lciBsb3JlbmNv
b21AZ21haWwuY29tCi0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvdWFydC5jCmluZGV4IDdkMDYwYjRjZDMzZC4uMDRmNDQyNTY1NmQxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvdWFydC5jCkBAIC0zMTgsNyArMzE4LDcgQEAgc3RhdGljIGludCBnYl91YXJ0X3dhaXRfZm9y
X2FsbF9jcmVkaXRzKHN0cnVjdCBnYl90dHkgKmdiX3R0eSkKIAkJcmV0dXJuIDA7CiAKIAlyZXQg
PSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmdiX3R0eS0+Y3JlZGl0c19jb21wbGV0ZSwK
LQkJCW1zZWNzX3RvX2ppZmZpZXMoR0JfVUFSVF9DUkVESVRfV0FJVF9USU1FT1VUX01TRUMpKTsK
KwkJbXNlY3NfdG9famlmZmllcyhHQl9VQVJUX0NSRURJVF9XQUlUX1RJTUVPVVRfTVNFQykpOwog
CWlmICghcmV0KSB7CiAJCWRldl9lcnIoJmdiX3R0eS0+Z2JwaHlfZGV2LT5kZXYsCiAJCQkidGlt
ZSBvdXQgd2FpdGluZyBmb3IgY3JlZGl0c1xuIik7Ci0tIAoyLjUzLjAKCg==
--0000000000005dfc6f064e1fc0da
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--0000000000005dfc6f064e1fc0da--
