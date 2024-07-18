Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE9A934D50
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jul 2024 14:38:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C74A14125A
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jul 2024 12:37:59 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	by lists.linaro.org (Postfix) with ESMTPS id 8BBEC40B40
	for <greybus-dev@lists.linaro.org>; Thu, 18 Jul 2024 03:32:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=NcDnrwxX;
	spf=pass (lists.linaro.org: domain of soyjuanarbol@gmail.com designates 209.85.221.177 as permitted sender) smtp.mailfrom=soyjuanarbol@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4f2ea4d80d6so147405e0c.2
        for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 20:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273572; x=1721878372; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwxJu27KxqSJJA/LPshmYXOW4rkUwmPyEJHd8O9VTg0=;
        b=NcDnrwxXh8y/iwtb1ZtkgVwv1ht1gaZv9cB91ftG6ooKtNysQL3rT2Gn7664WcJ0tX
         A4obfkF23bklJKKZmXDbUP33D4hegQ2+snR8F7faW/vqNbgbD/3e/ctmE+2F1f1H2Sxl
         Bhln+qqYqPUHuuSAa1CJzuGtFkV6HoLM/2CCTSFBNpmeutyqkiOELOiyEH4J1DvJoN1e
         0pijA6ZEMEEF9ewl2IwmhMnihLKQQrEdMkHHgKlTJw/JuZeS5i4vlEMeor3rpvpJ4yvZ
         QR6ASi2e+nIMJZtNx6M4xhu0m6x7txjexfoMLHgCO0F2YtGb0oOxLSAufdnQPGECbxgM
         MugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273572; x=1721878372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwxJu27KxqSJJA/LPshmYXOW4rkUwmPyEJHd8O9VTg0=;
        b=WVWGHT6dEKvwGEAB70cfhWg9sxkPk69ZkSMmrHbpIgOKhRuqDyObPbz321ru2IU+L2
         HkHPr24K7uZsv1lHzVUejw0AjDc9q1OqwhhIfeyex/RbEi1GA7PGmAKbwN1WcLCWGWMu
         Fbr8aLBc1wCRUoa2xn2W2rbEg8k8MGgf/j7wSit6/0JFSoX89yj+Ku4lKFNsH9fs9A2S
         2a0ymmoYwlpuTOO2ymUSXQ7wbvVy+B8DyxNsfJ1iGvphEv0xS7T8sA72Ls29G0QmCpP2
         6c3s5qat7ZHGyQ3sOLDlYIKi0WQ+VA4quusQheVW6TGebYqYKt8K8zhbBF3D0cIMtPdv
         RC6A==
X-Gm-Message-State: AOJu0YyNlrn0thXEf+43rxJH6BveUUzNkEqDz1wI4+Spg32l+VQBpr3+
	vlYs8+pJDKXbhxrg3W08sBeP4uTo6Spc2/Wyxh225a3ikHSmqB12
X-Google-Smtp-Source: AGHT+IEeKSQL1uTy69+TewRtzoQfxHTxK88+wkfnor583yF3CqLB+tjyij1cbo5XSfRexgBA2Sqj9A==
X-Received: by 2002:a05:6122:3d06:b0:4ef:530b:9d56 with SMTP id 71dfb90a1353d-4f4df66e7ddmr5308652e0c.6.1721273571458;
        Wed, 17 Jul 2024 20:32:51 -0700 (PDT)
Received: from fedora.. ([2800:e6:4000:47e:7c52:7bd4:cfe5:9874])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4f4ee9bfa27sm68582e0c.31.2024.07.17.20.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:32:51 -0700 (PDT)
From: =?UTF-8?q?Juan=20Jos=C3=A9=20Arboleda?= <soyjuanarbol@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 17 Jul 2024 22:32:07 -0500
Message-ID: <20240718033207.333591-1-soyjuanarbol@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <2024071723-nurture-magical-7817@gregkh>
References: <2024071723-nurture-magical-7817@gregkh>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8BBEC40B40
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.177:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,kernel.org,lists.linux.dev,nexus-software.ie,gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: soyjuanarbol@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7LRENEDQSQ5WCGAUQD7BGCWNVYXXJ6PU
X-Message-ID-Hash: 7LRENEDQSQ5WCGAUQD7BGCWNVYXXJ6PU
X-Mailman-Approved-At: Thu, 18 Jul 2024 12:37:56 +0000
CC: greybus-dev@lists.linaro.org, johan@kernel.org, linux-staging@lists.linux.dev, soyjuanarbol@gmail.com, trivial@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: break multi statement macro into multiple lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7LRENEDQSQ5WCGAUQD7BGCWNVYXXJ6PU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIG1hY3JvIGBnYl9sb29wYmFja19zdGF0c19hdHRyc2AgaW4gdGhlIEdyZXlidXMgbG9vcGJh
Y2sgZHJpdmVyDQpjb250YWlucyBtdWx0aXBsZSBzdGF0ZW1lbnRzLCB3aGljaCBzaG91bGQgYmUg
ZW5jbG9zZWQgaW4gYSBkby13aGlsZQ0KbG9vcCB0byBlbnN1cmUgcHJvcGVyIGV4ZWN1dGlvbiBh
bmQgYWRoZXJlIHRvIGNvZGluZyBzdGFuZGFyZHMuDQoNClRoZSBsYXR0ZXIgaXMgbm90IHBvc3Np
YmxlIGFzIHRoZSBtYWNybyBleHBhbnNpb24gd2lsbCBjcmVhdGUgaW52YWxpZCBDDQpzeW50YXgu
IFRoZXJlcyBpcyBub3Qgc3VjaCB0aGluZyBsaWtlIGlubmVyIGZ1bmN0aW9uIGRlZmluaXRpb24g
aW5zaWRlIGENCmdsb2JhbCBzY29wZSBkby13aGlsZSBpbiBDLg0KDQpUaGlzIHBhdGNoIG51a2Vz
IHRoZSBgZ2JfbG9vcGJhY2tfc3RhdHNfYXR0cnNgIG1hY3JvIHRvIGVuY2xvc2UsDQphZGRyZXNz
aW5nIHRoZSBzdHlsZSBlcnJvciBmbGFnZ2VkIGJ5IGNoZWNrcGF0Y2gucGwuDQoNClNpZ25lZC1v
ZmYtYnk6IEp1YW4gSm9zw6kgQXJib2xlZGEgPHNveWp1YW5hcmJvbEBnbWFpbC5jb20+DQotLS0N
Ck5vdGVzOg0KDQpUaGlzIG5ldyB2ZXJzaW9uIHVzZXMgYSBiaXQgZGlmZmVyZW50IGFwcHJvYWNo
IHNvIHRoZSBjb21taXQgbWVzc2FnZQ0Kd2lsbCBiZSBhIGJpdCBkaWZmZXJlbnQgYXMgd2VsbC4N
Cg0KUC5TOiBUaGFua3MgZm9yIGJlaW5nIHRoYXQgcGF0aWVuY2UgYW5kIGFwb2xvZ2llcyBmb3Ig
dGhhdCBmYWxzZQ0KcG9zaXRpdmUgb2YgYnVpbGRpbmcgdGhlIG5vbi1pbmNsdWRlZCBkcml2ZXIu
IE5vdyBpdCBpcyB0ZXN0ZWQtYnVpbHQuDQoNCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29w
YmFjay5jIHwgMjkgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
bG9vcGJhY2suYw0KaW5kZXggNDMxM2QzYmJjMjNhLi44OGQ4NmIwODRmMjggMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jDQorKysgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9sb29wYmFjay5jDQpAQCAtMTYyLDExICsxNjIsNiBAQCBzdGF0aWMgc3NpemVf
dCBuYW1lIyNfYXZnX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAkJXA0KIH0JCQkJCQkJCQlcDQog
c3RhdGljIERFVklDRV9BVFRSX1JPKG5hbWUjI19hdmcpDQogDQotI2RlZmluZSBnYl9sb29wYmFj
a19zdGF0c19hdHRycyhmaWVsZCkJCQkJXA0KLQlnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZp
ZWxkLCBtaW4sIHUpOwkJXA0KLQlnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZpZWxkLCBtYXgs
IHUpOwkJXA0KLQlnYl9sb29wYmFja19yb19hdmdfYXR0cihmaWVsZCkNCi0NCiAjZGVmaW5lIGdi
X2xvb3BiYWNrX2F0dHIoZmllbGQsIHR5cGUpCQkJCQlcDQogc3RhdGljIHNzaXplX3QgZmllbGQj
I19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwJCQkJXA0KIAkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwJCVwNCkBAIC0yNjgsMTUgKzI2MywyOSBAQCBzdGF0aWMgdm9pZCBnYl9s
b29wYmFja19jaGVja19hdHRyKHN0cnVjdCBnYl9sb29wYmFjayAqZ2IpDQogfQ0KIA0KIC8qIFRp
bWUgdG8gc2VuZCBhbmQgcmVjZWl2ZSBvbmUgbWVzc2FnZSAqLw0KLWdiX2xvb3BiYWNrX3N0YXRz
X2F0dHJzKGxhdGVuY3kpOw0KK2diX2xvb3BiYWNrX3JvX3N0YXRzX2F0dHIobGF0ZW5jeSwgbWlu
LCB1KTsNCitnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGxhdGVuY3ksIG1heCwgdSk7DQorZ2Jf
bG9vcGJhY2tfcm9fYXZnX2F0dHIobGF0ZW5jeSk7DQorDQogLyogTnVtYmVyIG9mIHJlcXVlc3Rz
IHNlbnQgcGVyIHNlY29uZCBvbiB0aGlzIGNwb3J0ICovDQotZ2JfbG9vcGJhY2tfc3RhdHNfYXR0
cnMocmVxdWVzdHNfcGVyX3NlY29uZCk7DQorZ2JfbG9vcGJhY2tfcm9fc3RhdHNfYXR0cihyZXF1
ZXN0c19wZXJfc2Vjb25kLCBtaW4sIHUpOw0KK2diX2xvb3BiYWNrX3JvX3N0YXRzX2F0dHIocmVx
dWVzdHNfcGVyX3NlY29uZCwgbWF4LCB1KTsNCitnYl9sb29wYmFja19yb19hdmdfYXR0cihyZXF1
ZXN0c19wZXJfc2Vjb25kKTsNCisNCiAvKiBRdWFudGl0eSBvZiBkYXRhIHNlbnQgYW5kIHJlY2Vp
dmVkIG9uIHRoaXMgY3BvcnQgKi8NCi1nYl9sb29wYmFja19zdGF0c19hdHRycyh0aHJvdWdocHV0
KTsNCitnYl9sb29wYmFja19yb19zdGF0c19hdHRyKHRocm91Z2hwdXQsIG1pbiwgdSk7DQorZ2Jf
bG9vcGJhY2tfcm9fc3RhdHNfYXR0cih0aHJvdWdocHV0LCBtYXgsIHUpOw0KK2diX2xvb3BiYWNr
X3JvX2F2Z19hdHRyKHRocm91Z2hwdXQpOw0KKw0KIC8qIExhdGVuY3kgYWNyb3NzIHRoZSBVbmlQ
cm8gbGluayBmcm9tIEFQQnJpZGdlJ3MgcGVyc3BlY3RpdmUgKi8NCi1nYl9sb29wYmFja19zdGF0
c19hdHRycyhhcGJyaWRnZV91bmlwcm9fbGF0ZW5jeSk7DQorZ2JfbG9vcGJhY2tfcm9fc3RhdHNf
YXR0cihhcGJyaWRnZV91bmlwcm9fbGF0ZW5jeSwgbWluLCB1KTsNCitnYl9sb29wYmFja19yb19z
dGF0c19hdHRyKGFwYnJpZGdlX3VuaXByb19sYXRlbmN5LCBtYXgsIHUpOw0KK2diX2xvb3BiYWNr
X3JvX2F2Z19hdHRyKGFwYnJpZGdlX3VuaXByb19sYXRlbmN5KTsNCisNCiAvKiBGaXJtd2FyZSBp
bmR1Y2VkIG92ZXJoZWFkIGluIHRoZSBHUEJyaWRnZSAqLw0KLWdiX2xvb3BiYWNrX3N0YXRzX2F0
dHJzKGdicGh5X2Zpcm13YXJlX2xhdGVuY3kpOw0KK2diX2xvb3BiYWNrX3JvX3N0YXRzX2F0dHIo
Z2JwaHlfZmlybXdhcmVfbGF0ZW5jeSwgbWluLCB1KTsNCitnYl9sb29wYmFja19yb19zdGF0c19h
dHRyKGdicGh5X2Zpcm13YXJlX2xhdGVuY3ksIG1heCwgdSk7DQorZ2JfbG9vcGJhY2tfcm9fYXZn
X2F0dHIoZ2JwaHlfZmlybXdhcmVfbGF0ZW5jeSk7DQogDQogLyogTnVtYmVyIG9mIGVycm9ycyBl
bmNvdW50ZXJlZCBkdXJpbmcgbG9vcCAqLw0KIGdiX2xvb3BiYWNrX3JvX2F0dHIoZXJyb3IpOw0K
LS0gDQoyLjQ1LjINCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBs
aXN0cy5saW5hcm8ub3JnCg==
