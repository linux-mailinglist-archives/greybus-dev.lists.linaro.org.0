Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E46DDD19A2E
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 15:55:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F2F6140155
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 14:55:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	by lists.linaro.org (Postfix) with ESMTPS id AFFCD3F73F
	for <greybus-dev@lists.linaro.org>; Tue, 13 Jan 2026 14:50:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=04yxPXjN;
	spf=pass (lists.linaro.org: domain of ukleinek@baylibre.com designates 209.85.221.48 as permitted sender) smtp.mailfrom=ukleinek@baylibre.com;
	dmarc=none
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43284ed32a0so3918736f8f.3
        for <greybus-dev@lists.linaro.org>; Tue, 13 Jan 2026 06:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768315823; x=1768920623; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pT8HtWZ7bhGeduu7Js1yvS3Fnv/m2JoB3j3HxYtKEl4=;
        b=04yxPXjNDbl2gu4aPV+fVzSzFL0sUV738pTAmF0Z5Qbrd/9OoOPk2iHQJ7XWuAVM78
         UWW/x4UZV4wuN6cvQ4utt9ZF0xyeAWOdHGIEqpT16M3CmIps9Bprs+cI1NDYOZho/UKU
         cHzOZ3XiKEHlrqNGSDKb6vgea9sl05MTaY45HjNtApfKQLc0sQnw4VIg8JIQqCwftnYa
         sPvV9GI9K7vDhpnbjHpPYKLUrj1Yvr5e2BeJBeHeerOlYzKSyu5BNwYjV2S2TFPIiqLu
         PT3NFE7vomJdHca9dIz0P3UvdN/LMYajvPZOpuIxjVbQSReCBbaOnxlB9vTGkfw+m7Zg
         b0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315823; x=1768920623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT8HtWZ7bhGeduu7Js1yvS3Fnv/m2JoB3j3HxYtKEl4=;
        b=WRslBQoSWIWxXlERuqZe6oOHVAMAs3G9/yUuQR0w+0i7poReoIG7vNBeEwxhg5W/o/
         B5gas/FkVYi/m2egcpVaQzjYdFCS1mAPyHCSdQ9MuDiaboLawVTSbwde5WqxAkjgxuNi
         z4w2AEHVWn+MbaWPHyk92AVUFai4FbwHe0VaFXnc5UlbEpUXiie771A+WvpfknFTt+JV
         HiJXmbe0iXI/jmUV2n1QHNH4ebQSlgt1Jq2d43DfD/DArtHJVhwi6/CKxQkZVw1wBpiy
         TlZ9AJ34SLk74jrO/C81ZIHaqwoE4oe02ybw+gE6nG/9GkeSLP76cGyXoQcgErTkIDw2
         B80g==
X-Forwarded-Encrypted: i=1; AJvYcCV9qOa+slcRtegLbvgW6YExTkxb5k5fkeiEqGBsRfLXtqk7yXP7Ga6iP6KZVRcpt1wiN+QTqK9wsLRU2Q==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy/Jf/XX8pmLT0OwbBTlEBY5nboc06IvwULIE4nmtTwIRknw2Ob
	s9o/7Szyet7ctB5XyuxFCjr/pNoxbQMzkW3sH9ImiczwjMngyb6weQXlIYauwOZIJi0=
X-Gm-Gg: AY/fxX5FTa6MlT5hb/3cx4wJvTsCG63XA4jgaTqTBZ+WFc2BVyn41u1f0+f5pgzEMOq
	6+wPx20a4Ed4IuZZc+y74LrsaliO2+2OVvGW4e4YfL4K7oMdf4E/oMeXALvtBtFkfEztUqAwef8
	oN4uJjJmypW94oiAxiE7g6x8oHFBe8SLw/bMiD73uNdpVEXOuA5oeUW9odOEowcUF+x+cN9XwUC
	XfTJAYS2y5Zc8ASqRMKECPVi0EGFqMCGMmiEcE7sXoLhwJIsnToak6yreUuL34GJWuK6di9V2xI
	WqE9z6JzMl5okoreeU/8/Wd7/sccln2KYsh9EgohFL+L/WLCg5/a79D+7FNy24YdeMAqARWivau
	JB9qj1o1A/TekI5sIiUcX0k/esCm0gQpIcCVBw3z0yVDT7TlQw6iKYMwQZ1Nt5lDVlyZhNUOgDz
	EjYJFDMkCc511swtrI5//jPvcs/Y+xLIiz6c/54wJJ1ejycVMcPsMAbe07Fsu6FzfhHQuNYkXa3
	DQ=
X-Google-Smtp-Source: AGHT+IECFzghAT8Q3ptMlbUy7ZuR27SMLHy0JrGto7kIH4jxQBz2y2Gie3XK2KIud6pvAnQLS/aaew==
X-Received: by 2002:a5d:5f54:0:b0:42f:bb9b:9a82 with SMTP id ffacd0b85a97d-432c37746d9mr26127012f8f.60.1768315822565;
        Tue, 13 Jan 2026 06:50:22 -0800 (PST)
Received: from localhost (p200300f65f20eb04fab5de2138b6a8fa.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:fab5:de21:38b6:a8fa])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0daa78sm45419522f8f.6.2026.01.13.06.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:50:22 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 13 Jan 2026 15:50:09 +0100
Message-ID: <20260113145012.2379944-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2465; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=gwGyGXZoKGhUR7yVpkCfGp98uDGh70OIB4gsT59bFI0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpZlukObv+1XpB9pMerotsBPU9oifT5io0rqk4E GHGQo/hLcSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaWZbpAAKCRCPgPtYfRL+ TgCSB/9mNe1EA83h6Cqwyr7JxazoacmIHbZJ9EssrEVmRRbrcG9WZqzmKX84NdvkrnG4gPUYhzy Qstz1t5COwNr+QCApJ4/5uje/c8es92xMDOYpKNn2p0ruIWRVAqZdfl8bNXypCgWnUnpyWqxcej ZSrOnsWXZeZgVUm6AUsFmabiTpKrSijpRiUErjossOCABd5uPBAYIMKSFsXMgx9L7C+8RoKvVGU cH8Riv/hOS05+/SwSsJaqeDaraqJjxaixQMCyrK3IcOMsNd+4dQHW0I5wj3FuynebSfAFczG1CS 9AWgjbpdGyFCNPpvEryiva32rZg1/cHxxJCaI11G9cCGHohx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-Rspamd-Queue-Id: AFFCD3F73F
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.20 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.48:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[baylibre.com];
	DWL_DNSWL_BLOCKED(0.00)[gappssmtp.com:dkim];
	URIBL_BLOCKED(0.00)[baylibre.com:from_smtp,baylibre.com:mid,baylibre.com:email,baylibre.com:from_mime];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,ukleinek@baylibre.com];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[209.85.221.48:from];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IXTOBPUIIL5ZWHRGCCYHSAAV52W3EGGS
X-Message-ID-Hash: IXTOBPUIIL5ZWHRGCCYHSAAV52W3EGGS
X-Mailman-Approved-At: Tue, 13 Jan 2026 14:55:26 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: Use bus methods for .probe() and .remove()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IXTOBPUIIL5ZWHRGCCYHSAAV52W3EGGS/>
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
IHRvIGV2ZW50dWFsbHkgcmVtb3ZlIHRoZXNlLg0KDQpBY2tlZC1ieTogSm9oYW4gSG92b2xkIDxq
b2hhbkBrZXJuZWwub3JnPg0KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+DQotLS0NCkNoYW5nZXMgc2luY2UgKGltcGxpY2l0KSB2
MSwNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2dyZXlidXMtZGV2LzIwMjUxMjEwMTc1OTQzLjU5
MDA1OS0yLXUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb206DQoNCiAtIGtlZXAgdGFicyBpbiB0
aGUgc3RydWN0IGluaXRpYWxpemVyDQogLSBBZGQgQWNrIGJ5IEpvaGFuDQoNCiBkcml2ZXJzL2dy
ZXlidXMvY29yZS5jIHwgMjIgKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3JleWJ1cy9jb3JlLmMgYi9kcml2ZXJzL2dyZXlidXMvY29yZS5jDQppbmRleCAzMTNlYjY1
Y2Y3MDMuLjQ1YzU0MzdjNDYwZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9jb3JlLmMN
CisrKyBiL2RyaXZlcnMvZ3JleWJ1cy9jb3JlLmMNCkBAIC0xODUsMTMgKzE4NSw2IEBAIHN0YXRp
YyB2b2lkIGdyZXlidXNfc2h1dGRvd24oc3RydWN0IGRldmljZSAqZGV2KQ0KIAl9DQogfQ0KIA0K
LWNvbnN0IHN0cnVjdCBidXNfdHlwZSBncmV5YnVzX2J1c190eXBlID0gew0KLQkubmFtZSA9CQki
Z3JleWJ1cyIsDQotCS5tYXRjaCA9CWdyZXlidXNfbWF0Y2hfZGV2aWNlLA0KLQkudWV2ZW50ID0J
Z3JleWJ1c191ZXZlbnQsDQotCS5zaHV0ZG93biA9CWdyZXlidXNfc2h1dGRvd24sDQotfTsNCi0N
CiBzdGF0aWMgaW50IGdyZXlidXNfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQ0KIHsNCiAJc3Ry
dWN0IGdyZXlidXNfZHJpdmVyICpkcml2ZXIgPSB0b19ncmV5YnVzX2RyaXZlcihkZXYtPmRyaXZl
cik7DQpAQCAtMjUyLDcgKzI0NSw3IEBAIHN0YXRpYyBpbnQgZ3JleWJ1c19wcm9iZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQogCXJldHVybiAwOw0KIH0NCiANCi1zdGF0aWMgaW50IGdyZXlidXNfcmVt
b3ZlKHN0cnVjdCBkZXZpY2UgKmRldikNCitzdGF0aWMgdm9pZCBncmV5YnVzX3JlbW92ZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1Y3QgZ3JleWJ1c19kcml2ZXIgKmRyaXZlciA9IHRv
X2dyZXlidXNfZHJpdmVyKGRldi0+ZHJpdmVyKTsNCiAJc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxl
ID0gdG9fZ2JfYnVuZGxlKGRldik7DQpAQCAtMjkxLDEwICsyODQsMTcgQEAgc3RhdGljIGludCBn
cmV5YnVzX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogCXBtX3J1bnRpbWVfc2V0X3N1c3Bl
bmRlZChkZXYpOw0KIAlwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5kKGRldik7DQogCXBt
X3J1bnRpbWVfcHV0X25vaWRsZShkZXYpOw0KLQ0KLQlyZXR1cm4gMDsNCiB9DQogDQorY29uc3Qg
c3RydWN0IGJ1c190eXBlIGdyZXlidXNfYnVzX3R5cGUgPSB7DQorCS5uYW1lID0JCSJncmV5YnVz
IiwNCisJLm1hdGNoID0JZ3JleWJ1c19tYXRjaF9kZXZpY2UsDQorCS51ZXZlbnQgPQlncmV5YnVz
X3VldmVudCwNCisJLnByb2JlID0JZ3JleWJ1c19wcm9iZSwNCisJLnJlbW92ZSA9CWdyZXlidXNf
cmVtb3ZlLA0KKwkuc2h1dGRvd24gPQlncmV5YnVzX3NodXRkb3duLA0KK307DQorDQogaW50IGdy
ZXlidXNfcmVnaXN0ZXJfZHJpdmVyKHN0cnVjdCBncmV5YnVzX2RyaXZlciAqZHJpdmVyLCBzdHJ1
Y3QgbW9kdWxlICpvd25lciwNCiAJCQkgICAgY29uc3QgY2hhciAqbW9kX25hbWUpDQogew0KQEAg
LTMwNSw4ICszMDUsNiBAQCBpbnQgZ3JleWJ1c19yZWdpc3Rlcl9kcml2ZXIoc3RydWN0IGdyZXli
dXNfZHJpdmVyICpkcml2ZXIsIHN0cnVjdCBtb2R1bGUgKm93bmVyLA0KIA0KIAlkcml2ZXItPmRy
aXZlci5idXMgPSAmZ3JleWJ1c19idXNfdHlwZTsNCiAJZHJpdmVyLT5kcml2ZXIubmFtZSA9IGRy
aXZlci0+bmFtZTsNCi0JZHJpdmVyLT5kcml2ZXIucHJvYmUgPSBncmV5YnVzX3Byb2JlOw0KLQlk
cml2ZXItPmRyaXZlci5yZW1vdmUgPSBncmV5YnVzX3JlbW92ZTsNCiAJZHJpdmVyLT5kcml2ZXIu
b3duZXIgPSBvd25lcjsNCiAJZHJpdmVyLT5kcml2ZXIubW9kX25hbWUgPSBtb2RfbmFtZTsNCiAN
Cg0KYmFzZS1jb21taXQ6IDhmMGI0Y2NlNDQ4MWZiMjI2NTM2OTdjY2VkOGQwZDA0MDI3Y2IxZTgN
Ci0tIA0KMi40Ny4zDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
