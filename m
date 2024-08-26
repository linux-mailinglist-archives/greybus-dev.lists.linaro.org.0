Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9195FA5F
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 22:07:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1060144325
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 20:07:14 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	by lists.linaro.org (Postfix) with ESMTPS id 1E56340B91
	for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2024 08:32:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=b6ZWEghN;
	spf=pass (lists.linaro.org: domain of dorine.a.tipo@gmail.com designates 209.85.208.48 as permitted sender) smtp.mailfrom=dorine.a.tipo@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c0a9ae3665so894424a12.0
        for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2024 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724661143; x=1725265943; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgvhKChH58fdViCS840EYZM8/m6pFZNLigDxHPU66NY=;
        b=b6ZWEghNecnc0YGmXs1+hn/BvZyPz7CbgrJJtuKV5fFaKsHfnUrpJbgcMOWS/mO64r
         RNZu9KHqoEP8ol+nklDt8NY923LT69CP7mRN5XS48pn10GhXwFnoHht5IBgJPpSzl31P
         sDCh+TIZel3itrtpWFBxgn90xu64Y5U+Qi3KMvOPgYUm3MiFLSu4VJqflBsKmKaw4QWo
         t6K/QU34htkWPaAbC20Uu+U1vC6Y8VL5vamunAuVLEvCKVjfa3U10kVOOLV11HqmE7Y2
         /ZF/QECAJ//Lt3vssrbYe906ED2aqCjF16OLU1mWOys2aWIeGJFGqvxhc/Z2JoL/64ON
         0ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661143; x=1725265943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgvhKChH58fdViCS840EYZM8/m6pFZNLigDxHPU66NY=;
        b=XuYOOQoZsStvQF8gmX/eI/aMbmTGwk6hgkhicOVWsYqwp3L6OSqQF0VWj8heXPJIyO
         aVR7GSu3gA8HYq5nUYaLapdhiyHMOasm+X5ZNA3AE1pgznrenC6E6gqpMbeuWs2OxRjf
         w1mjnb1VEsVcx1Z4Kf/lAgYnbaYRPzcesZZ2YMUpjsX2cuXZafAeDIBWgVOfvz+btklL
         uavxsgl6Boc8+Jgl0GUapgzodM67QiyDrZDLTRojTlecyJ3ims39R3/RD0PLV1CvLbVg
         wr8Lv5BIOmgyXLgdRGUq9fsll1T8arRc6tlghyFRmoG1Rr1TJT05Avt9LXEqLh6k2/j7
         YvFw==
X-Forwarded-Encrypted: i=1; AJvYcCV8KojHnY+c9FMZB8sqLj0YfTONVIHqzMiJC7FVMVP3YNIn7MJTtKQsFVZdULgQuh0VMm57sW/SEhHDTQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YzjCyWV8ly5g+W4Nd4cJBwfVh+2LtdxJCqxAdmE2LwNoEYagxVt
	aWOHshUEhIpMzy1p/weaSPaashsOHmtFu3rW6qMxESHd/z9ABRtw
X-Google-Smtp-Source: AGHT+IFu05B8AxWKItCL0B+EGMRJkjoMGa+7VFx0YbUzfGBpKWH9H6W0eL/1pJ+F1LF1mFwUgPYz9g==
X-Received: by 2002:a17:906:eec6:b0:a72:8762:1f5d with SMTP id a640c23a62f3a-a86a54aa602mr692578866b.55.1724661142308;
        Mon, 26 Aug 2024 01:32:22 -0700 (PDT)
Received: from ubuntu-focal ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2b0758sm633289066b.84.2024.08.26.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:32:21 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 26 Aug 2024 08:32:12 +0000
Message-Id: <20240826083213.23499-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Bar: -
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1E56340B91
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,nexus-software.ie,kernel.org,lists.linaro.org,lists.linux.dev,gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.48:from];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[]
X-MailFrom: dorine.a.tipo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TYAQO4G5QK4PO2KXD4M2EU3VZVWHLRVI
X-Message-ID-Hash: TYAQO4G5QK4PO2KXD4M2EU3VZVWHLRVI
X-Mailman-Approved-At: Mon, 26 Aug 2024 20:07:11 +0000
CC: Dorine Tipo <dorine.a.tipo@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Enclose multi-statement Macro in a do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TYAQO4G5QK4PO2KXD4M2EU3VZVWHLRVI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Update the gb_loopback_stats_attrs() macro to use a do-while(0) loop.
This ensures that it is treated as a single statement, preventing
potential issues when used in conditional or loop constructs.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..0f3e4c43e2de 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)

 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field);
+	} while (0)

 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
--
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
