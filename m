Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DF899CB3BC2
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Dec 2025 19:15:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A6EA63F987
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Dec 2025 18:15:35 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	by lists.linaro.org (Postfix) with ESMTPS id E515B3F8EF
	for <greybus-dev@lists.linaro.org>; Wed, 10 Dec 2025 17:59:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=1AC2sehk;
	spf=pass (lists.linaro.org: domain of ukleinek@baylibre.com designates 209.85.208.68 as permitted sender) smtp.mailfrom=ukleinek@baylibre.com;
	dmarc=none
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-6495e5265c9so207373a12.0
        for <greybus-dev@lists.linaro.org>; Wed, 10 Dec 2025 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765389591; x=1765994391; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EFkqmnayog6/iF/z5REs4/B5Gn/JbHrMchq7CzJFwrE=;
        b=1AC2sehk1B3y6g87b/7CpOzTF+dBwMnwqhrEd1/dyGtkqAJv92a+b4eVqW5yiJRP4R
         llm6q3VPu2kvfTCu0EcqhCpemn8ys4lmCnGn2nhbjxhgNyxEzv0yECaeydxteUc+D87d
         yDKIUcu/miSNg0Qzid6KO4pqO90CoN753mqk+CUg+3iyGDT1n7WuS/zyOgxEpkCuTffx
         QwBN34UYjVogz1rTRYKDN94d1J688CkhWgq//Kbiv4NNdZAye6HqGUFOtOgfCWM9MCQF
         Uw9FhfQitvfAKFqOFAVSFeZuw5zwbxy7ZYzwMEpz1CEc3REL9sztVuDapLaKxfrQNSxo
         PRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389591; x=1765994391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFkqmnayog6/iF/z5REs4/B5Gn/JbHrMchq7CzJFwrE=;
        b=HPcvRBkwzMCS2tHnKozdcy6ZCGduaG5xZTWtrB/RO04B23I70E+BIR3B9/PqhmSXJs
         x1AyUrbBQA+fLEG+NpJX9jLlFZafhWsiC+N0jaTBOqGwN4ZAQI1fltCuzf6G7HZeOjJL
         jyod1E+gi/55HkF5uTHD9wyKqnZRzXhoE8e155F7HSJiNghAM37osm8hW5e9LPz0+PzZ
         ka/oXNoI0XkjvHWi46t9frPb5GXYcONIJbsmyllXbieO/ckuFD8hPCnnMSreC8N5ZTND
         xyI19zu6PFQE/8H+d9pll7U2bTlF9X0/Eq2BlK+E2Qpim+7FjJwLWay6Ln4y6r1fEgL9
         iupw==
X-Gm-Message-State: AOJu0Yyw4Tpl3qtjFuIE6I2S/uD/SyPvIwKQNi6tuzNSDDjl5iBCX00b
	jVs/IixqNpaKBz6gQJT2OuFtjXBOzzPDrvFjS0XYf5Eg5vvPNniWsH832HF8vW5Mxhc=
X-Gm-Gg: AY/fxX7k3AK1f5DVxtYkjGPmOaNQFo3vL8GIE8Muxdm4ibUCWv/h51durZm/uK8b+O4
	3qJG7E4FXUuDZDSq+zbcwgPG8D/xPLivl2akFXzuGVJJM4k5AI8RYA0X/YAyfpyasQAqOTZtQjb
	XIRlDd4Zc1C5h4yUmrCUrTjK/wYxEHVqUM5w++OY8CURYTH3szHGmrrq10bjJpFbHUkx3zq5zED
	e5ANJe3MZVH1g07+B1PoGi7RnG1D3XnfkfVYrFZmY0IRrrTWlqNHAysxInqfFFzKTLdq4iKuXMe
	hexYXVFNiMMbqHWn926LN9v4F+x8oGSVH/AVIrsG3Ve4OZlXUJ//QuV7HxgaF2mLa/GTbpyvY5e
	8mi8UN0VKQF+pUu/RImiPs3e0RcJ9HB7ci2qQtyY7VANhk3bmDgoY3ijxavwCzhP2x5JmdItdqu
	+xv90nA76RAYFsORQJwqIKWxOV0/6m6wZZjqgFAxU8TmZV+rF2nRnZuQ8M6cKga479974ptfxQX
	vU=
X-Google-Smtp-Source: AGHT+IG2rlZyjcc/tYrtjvT/Q0PCj6fk/Fy7JSs/ZXV192mbLk8PePtuxLXIwrBn7ykMM6aHatW6PQ==
X-Received: by 2002:a05:6402:909:b0:641:9aac:e4bd with SMTP id 4fb4d7f45d1cf-6496d5c1cf0mr3054553a12.26.1765389590753;
        Wed, 10 Dec 2025 09:59:50 -0800 (PST)
Received: from localhost (p200300f65f006608868542d9bf7bf8b7.dip0.t-ipconnect.de. [2003:f6:5f00:6608:8685:42d9:bf7b:f8b7])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64982040b8bsm226222a12.2.2025.12.10.09.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:59:49 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 10 Dec 2025 18:59:39 +0100
Message-ID: <20251210175943.590059-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=XjPeFpxiBeyk9ZbPvkieMx7WFnCAUCw0ErTUfHMWoPI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhkzLrfxq2016X2vGbvBaM+VsQ/pFvr/pUnNeL7859XMo6 1f2NovGTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAm4r+Ag6FfIy1oqsenrDwr tTnnNwV9yPv+54wLtwr3kfpNkpkhsi27//gkF6n7/aw7ouRhuWNvf9yXWamNncIfHN3+BVnaL13 MNjdBbM/63ynTZc4WRflrJ63/+Lb79aTLqW1Lm+RXHJOU7vLRfHDl5vTzBVuFhAT59DZl/0+MZC rIueuwOFxYz+JSUXNjXFyCRu2fOxPnSotvnmrNO+vGhiUKrFYJVhM3cbdVZDa27fC/XW6j8uXJr Ij26+Lv8ws3xaQEW6ZY5bD8flfHZVn1R67QQ7tH7nXdtGNWd4STp4mcX6hyTOygH+t2vhMnggR1 39zvyF6blnAwp+rVkY9Bayu3bJmUysKxqeooC7Mrt4w9AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.20 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.68:from];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[209.85.208.68:server fail,2003:f6:5f00:6608:8685:42d9:bf7b:f8b7:server fail];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	DMARC_NA(0.00)[baylibre.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,mail-ed1-f68.google.com:rdns,mail-ed1-f68.google.com:helo];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E515B3F8EF
X-Spamd-Bar: --
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NDNVPZ3IFE5FSM2FO2W6WLPPALUQNIDF
X-Message-ID-Hash: NDNVPZ3IFE5FSM2FO2W6WLPPALUQNIDF
X-Mailman-Approved-At: Wed, 10 Dec 2025 18:15:29 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Use bus methods for .probe() and .remove()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NDNVPZ3IFE5FSM2FO2W6WLPPALUQNIDF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlc2UgYXJlIG5lYXJseSBpZGVudGljYWwgdG8gdGhlIHJlc3BlY3RpdmUgZHJpdmVyIGNhbGxi
YWNrcy4gVGhlIG9ubHkNCmRpZmZlcmVuY2UgaXMgdGhhdCAucmVtb3ZlKCkgcmV0dXJucyB2b2lk
IGluc3RlYWQgb2YgaW50Lg0KDQpUaGUgb2JqZWN0aXZlIGlzIHRvIGdldCByaWQgb2YgdXNlcnMg
b2Ygc3RydWN0IGRldmljZV9kcml2ZXIgY2FsbGJhY2tzDQoucHJvYmUoKSBhbmQgLnJlbW92ZSgp
IHRvIGV2ZW50dWFsbHkgcmVtb3ZlIHRoZXNlLg0KDQpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3Jl
eWJ1cy9jb3JlLmMgfCAyMiArKysrKysrKysrLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncmV5YnVzL2NvcmUuYyBiL2RyaXZlcnMvZ3JleWJ1cy9jb3JlLmMNCmluZGV4IDMxM2ViNjVj
ZjcwMy4uOTI3YTY5ZmViM2ZjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncmV5YnVzL2NvcmUuYw0K
KysrIGIvZHJpdmVycy9ncmV5YnVzL2NvcmUuYw0KQEAgLTE4NSwxMyArMTg1LDYgQEAgc3RhdGlj
IHZvaWQgZ3JleWJ1c19zaHV0ZG93bihzdHJ1Y3QgZGV2aWNlICpkZXYpDQogCX0NCiB9DQogDQot
Y29uc3Qgc3RydWN0IGJ1c190eXBlIGdyZXlidXNfYnVzX3R5cGUgPSB7DQotCS5uYW1lID0JCSJn
cmV5YnVzIiwNCi0JLm1hdGNoID0JZ3JleWJ1c19tYXRjaF9kZXZpY2UsDQotCS51ZXZlbnQgPQln
cmV5YnVzX3VldmVudCwNCi0JLnNodXRkb3duID0JZ3JleWJ1c19zaHV0ZG93biwNCi19Ow0KLQ0K
IHN0YXRpYyBpbnQgZ3JleWJ1c19wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1
Y3QgZ3JleWJ1c19kcml2ZXIgKmRyaXZlciA9IHRvX2dyZXlidXNfZHJpdmVyKGRldi0+ZHJpdmVy
KTsNCkBAIC0yNTIsNyArMjQ1LDcgQEAgc3RhdGljIGludCBncmV5YnVzX3Byb2JlKHN0cnVjdCBk
ZXZpY2UgKmRldikNCiAJcmV0dXJuIDA7DQogfQ0KIA0KLXN0YXRpYyBpbnQgZ3JleWJ1c19yZW1v
dmUoc3RydWN0IGRldmljZSAqZGV2KQ0KK3N0YXRpYyB2b2lkIGdyZXlidXNfcmVtb3ZlKHN0cnVj
dCBkZXZpY2UgKmRldikNCiB7DQogCXN0cnVjdCBncmV5YnVzX2RyaXZlciAqZHJpdmVyID0gdG9f
Z3JleWJ1c19kcml2ZXIoZGV2LT5kcml2ZXIpOw0KIAlzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUg
PSB0b19nYl9idW5kbGUoZGV2KTsNCkBAIC0yOTEsMTAgKzI4NCwxNyBAQCBzdGF0aWMgaW50IGdy
ZXlidXNfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikNCiAJcG1fcnVudGltZV9zZXRfc3VzcGVu
ZGVkKGRldik7DQogCXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoZGV2KTsNCiAJcG1f
cnVudGltZV9wdXRfbm9pZGxlKGRldik7DQotDQotCXJldHVybiAwOw0KIH0NCiANCitjb25zdCBz
dHJ1Y3QgYnVzX3R5cGUgZ3JleWJ1c19idXNfdHlwZSA9IHsNCisJLm5hbWUgPSAiZ3JleWJ1cyIs
DQorCS5tYXRjaCA9IGdyZXlidXNfbWF0Y2hfZGV2aWNlLA0KKwkudWV2ZW50ID0gZ3JleWJ1c191
ZXZlbnQsDQorCS5wcm9iZSA9IGdyZXlidXNfcHJvYmUsDQorCS5yZW1vdmUgPSBncmV5YnVzX3Jl
bW92ZSwNCisJLnNodXRkb3duID0gZ3JleWJ1c19zaHV0ZG93biwNCit9Ow0KKw0KIGludCBncmV5
YnVzX3JlZ2lzdGVyX2RyaXZlcihzdHJ1Y3QgZ3JleWJ1c19kcml2ZXIgKmRyaXZlciwgc3RydWN0
IG1vZHVsZSAqb3duZXIsDQogCQkJICAgIGNvbnN0IGNoYXIgKm1vZF9uYW1lKQ0KIHsNCkBAIC0z
MDUsOCArMzA1LDYgQEAgaW50IGdyZXlidXNfcmVnaXN0ZXJfZHJpdmVyKHN0cnVjdCBncmV5YnVz
X2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgbW9kdWxlICpvd25lciwNCiANCiAJZHJpdmVyLT5kcml2
ZXIuYnVzID0gJmdyZXlidXNfYnVzX3R5cGU7DQogCWRyaXZlci0+ZHJpdmVyLm5hbWUgPSBkcml2
ZXItPm5hbWU7DQotCWRyaXZlci0+ZHJpdmVyLnByb2JlID0gZ3JleWJ1c19wcm9iZTsNCi0JZHJp
dmVyLT5kcml2ZXIucmVtb3ZlID0gZ3JleWJ1c19yZW1vdmU7DQogCWRyaXZlci0+ZHJpdmVyLm93
bmVyID0gb3duZXI7DQogCWRyaXZlci0+ZHJpdmVyLm1vZF9uYW1lID0gbW9kX25hbWU7DQogDQoN
CmJhc2UtY29tbWl0OiA3ZDBhNjZlNGJiOTA4MWQ3NWM4MmVjNDk1N2M1MDAzNGNiMGVhNDQ5DQot
LSANCjIuNDcuMw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
