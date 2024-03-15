Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D128C87D3F5
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:50:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E3CF4451EF
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:50:16 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	by lists.linaro.org (Postfix) with ESMTPS id E34B540A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:50:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=YnNefLdj;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.180 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso1823196a12.3
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528611; x=1711133411; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nbbG9YmsxAe8ShcpMeSH39B4N2p7H9qd49dYIKblRo=;
        b=YnNefLdj1nnADgd2BYAcMzvS6iFl1yNmY3XmJtNi0asuTNKaV3iQorjYGN0CVrRMPV
         iFpU2BmMeWC2ZeeIvaqnCxiU630VmGm+zBJ5uJclM0A2I7iqoggoK5BHiGoV1IqZysGz
         Yvse2wJBmHvnDQKo4sjN1+z8WysVyKvcPHwDQpS07I4XQ7VMFok1rmAqWQRKXkIZelOA
         xNHz0otEbeDwSemSufNqRsK+XvgWHT6nkh4jKn8vfnFNBhpEhaXarQrxcayXpnY/r+tT
         1YkMBPXtM+2rCSC/djUSivNO+2MCvSixrL+p04+hIdCGcNzl9O6vEaNGrz+0RqEd6+K6
         ox0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528611; x=1711133411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nbbG9YmsxAe8ShcpMeSH39B4N2p7H9qd49dYIKblRo=;
        b=fNHG9B4AyqlH9QPJLdR9oOwoB0JlFT/REIXkK5SQiCdzKD4f9cLRWq91fLPD0LzalC
         EcXz11DY1be6KAzi/lYS6lQHRN4WGe0C6bIxwc77dcUui3VlUvRpuSUPUVEmyR/LGh6v
         tx4NS1GuMkEy1ZV1CAJUTWg6ZyLoG88EP0gjD82lvQW6jlVfaGu7cY1RCrH6YBqiOdGn
         KLIK66EaloRp9AaJbvaQSchWwqqrvp6rYDGodqEvOt6QTxtC6FbRPrw+BGQAFH9ThUO4
         NoWx6g7xJG+6wIRGLmiug3yE1BQFJwaCglgaSdOqm8RD2ZQQ9MeKGgAH5MDpv5EmSUq/
         2GeA==
X-Forwarded-Encrypted: i=1; AJvYcCXbjiYlb9WcbkViL0U3+kp4DVsdnfxRwNLN7omVo7uX7hdVOm7yE9wJWQcSOowDIMKjuDFbddEZ2Vf0s00SlJUhLts7SyXAd27ZYJS8
X-Gm-Message-State: AOJu0YwoobQJWt/ET6jeIuDvqM2FBEvH1/2GEUiY9LoPyAfGLWvCmApy
	uiGYX0DZxxws1oPAKKbgbTS3k6lFWdcjM6LuWDPOLyXmoGT0nHjt
X-Google-Smtp-Source: AGHT+IFA9XzN2jLwuRUEijbwT8pIPy83qqcaER/RU0ti3qY2ElIKDW3ox6g28Xxuwh3Y/MTEOyOcvg==
X-Received: by 2002:a05:6a20:1450:b0:1a1:4808:7c95 with SMTP id a16-20020a056a20145000b001a148087c95mr5266375pzi.37.1710528610773;
        Fri, 15 Mar 2024 11:50:10 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:50:10 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:19:03 +0530
Message-ID: <20240315184908.500352-6-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E34B540A53
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.180:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[mail-pg1-f180.google.com:rdns,mail-pg1-f180.google.com:helo];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: Z5IDJGEJM56SPAQ42B4I5JGAWOT4FLI5
X-Message-ID-Hash: Z5IDJGEJM56SPAQ42B4I5JGAWOT4FLI5
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 5/8] regulator: fixed-helper: export regulator_register_always_on
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z5IDJGEJM56SPAQ42B4I5JGAWOT4FLI5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Export regulator_register_always_on() to allow use in kernel modules

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/regulator/fixed-helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/fixed-helper.c b/drivers/regulator/fixed-helper.c
index 2d5a42b2b3d8..0e9784009c07 100644
--- a/drivers/regulator/fixed-helper.c
+++ b/drivers/regulator/fixed-helper.c
@@ -59,3 +59,4 @@ struct platform_device *regulator_register_always_on(int id, const char *name,
 
 	return &data->pdev;
 }
+EXPORT_SYMBOL_GPL(regulator_register_always_on);
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
