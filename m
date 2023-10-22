Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 996917F6635
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A9E703EF5A
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:35 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id A4C213EFD6
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 12:16:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=JzxbBhu3;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c9a1762b43so19369635ad.1
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697976972; x=1698581772; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+S2mdckSSp2Nfs5ye+ND5i2vKp9m6YBgPQvt8jtLlY=;
        b=JzxbBhu3ugWkdlhGT46BfjRr8se71lLybhH4BGYdbHfTkTKKghWTZltkMawEvptRZD
         SKOjVacMiF9Ux4vxoc5qpcuoxAQNVvR0iFTWqfvUxjQnf4j7GxJ6JhCjJ4/edXaeKvcL
         So+kfxHbHrM7Wctl/BQbpJJT884vpXaRNnMqg9VFPksBbYYdJ27UoUQEwJdfBZQJg3Bp
         B/7TT1hiGLyIxfw95n6pLoVh8p3i6PN+rduDhZ8+0+osgHGCeBP8aKc7DGBvrl9+dGH9
         fkppSbJr43ojPInZRB9pk+ma+Qfro600CQ/nkE/ElDvrzicboa/0hWZtYrbvSuvYIW3S
         qUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697976972; x=1698581772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+S2mdckSSp2Nfs5ye+ND5i2vKp9m6YBgPQvt8jtLlY=;
        b=N2TJPk0S1n7cfMPCQGlhTWhyIfl4TqUBRd5ZhVFxZCE2JLjdSLSpZWPEnFX7R4l6JU
         6RTle8LBqCS+3dYwM4Nx0lyzzwf4BZ+t0vc53fcU3LeXWHBFZjhRNOZJBeqj2XVwnW1q
         Xs5VcMuXnEVIKTX8e8qt/elppV8f0Ay4creySdi3lBOGWXrEnb+l5THcd+11GxVb0maO
         0tFziW818n/72jXaR+OtSbIrkv1U+99x1JZ5nY708CR2QnvK2QH+gPltJ4FagV2oE670
         gbkZFcoLbm4LKQFa0CXKGjRnYdfQC2WN7S4oCIRLZHdfxPdGYqt/8i6c8JARcX2bxoyV
         xFRg==
X-Gm-Message-State: AOJu0YwKH2Git322AOxb00lLsyij4vf+3kD0z1QN6lyUK6/yovpu40vq
	xY+4K56z8PgF26d9Py9UIlw=
X-Google-Smtp-Source: AGHT+IGjoR0YMcAj2F7zAWRDZOhI9k2JNW4ERSe30aG0pfFa024ofCeya2M+RkiNweOChf+FSqQW2w==
X-Received: by 2002:a17:902:e88f:b0:1c7:23c9:a7db with SMTP id w15-20020a170902e88f00b001c723c9a7dbmr6767428plg.26.1697976971794;
        Sun, 22 Oct 2023 05:16:11 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001c9c879ee4asm4366495plf.17.2023.10.22.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:16:11 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:15:57 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A4C213EFD6
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HSGDHDZIFD4PSPLWAL4OBOCBV323RDHV
X-Message-ID-Hash: HSGDHDZIFD4PSPLWAL4OBOCBV323RDHV
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:54 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/3] staging: greybus: camera: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HSGDHDZIFD4PSPLWAL4OBOCBV323RDHV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Alignment should match open parenthesis

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index ae49e37a87e9..6516e7efaab9 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 }
 
 static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp)
+				      struct gb_camera_configure_streams_response *resp)
 {
 	unsigned int max_pkt_size = 0;
 	unsigned int i;
@@ -378,8 +378,8 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		struct gb_camera_csi_params *csi_params)
+					   struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
 	struct gb_connection *conn;
@@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
 }
 
 static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
-		unsigned int *flags, struct gb_camera_stream *streams,
-		struct gb_camera_csi_params *csi_params)
+					  unsigned int *flags, struct gb_camera_stream *streams,
+					  struct gb_camera_csi_params *csi_params)
 {
 	struct gb_camera *gcam = priv;
 	struct gb_camera_stream_config *gb_streams;
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
