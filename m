Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56E7F6626
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:26:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5F4A40447
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:26:20 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by lists.linaro.org (Postfix) with ESMTPS id 96B293EFEA
	for <greybus-dev@lists.linaro.org>; Thu, 19 Oct 2023 21:39:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="cxDCby/S";
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.179 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf55a81eeaso1216765ad.0
        for <greybus-dev@lists.linaro.org>; Thu, 19 Oct 2023 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697751595; x=1698356395; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bzd/mX+G6RAAmLpCVFwycoQWQ7+3hjDN3n5S0L3+DGw=;
        b=cxDCby/SrI4jy90y9ULgE6Y0svkT5CJ9qr/L9jv2iLPoxeS+VdvNj069FXQ8BB1lW1
         ahUqwqsOvEaTWOqJhfVI/waH+5Cvv5dUsyaMfhdVJ6BTYuRDv/SqYBzQtsK1AvJR8rdv
         1Ma7N5TXCh4B7TtotNtC47evnehXrVFhCjyrbWPnb/CMW1qRynd1FnbmAPOXS49r+IKq
         hzUyeYYQdjvyVRGVvu2NTCdqAds/8CzlIYD/uoC/MWDR+3NQWCdD09x5aUiAqhXqpuBV
         rCVc9KnL58tP6KUpjl6EXAnMFTsgy3u6BLlsGAAls3GKAUxSozAZWyueZg25Ioe3Ijyi
         TnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697751595; x=1698356395;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzd/mX+G6RAAmLpCVFwycoQWQ7+3hjDN3n5S0L3+DGw=;
        b=I6LSz98P2WuyuZSa6U8Z3Ir7h0P182L4+UYII08AZUF4xCztSCntkGpyBF4vTQY+GR
         OMBKPLjdH7MQnADkvoA2SyjOjks7IZpRR33FjY9PTg+IMVaqyEhzMZemNGuHc2EdUXY8
         9BW4FK/6Cbvgp/K/VaQTFcsH08AJKFGuwnRNEzotULN2lKfAZ8TLavHJEKo/Et9EbXWk
         zUlBc9kREQmJU73iKdfB6vous7SVRsikZ0Y2H9Zddm4spNfKhQNW1eKwABC/+aFGWkaR
         rmk2Mj9fTw+c0iz9X7EXoE2PmFLv62NzY5neiUvKaCrLIt2DxnZctVINGbeegqHspV9g
         reog==
X-Gm-Message-State: AOJu0YzdldORLEIlJNyo5f+2pcWm9+VQ0jV4qxqkhmeYTAcMpCHbIM00
	mRxUp2OyDVm4a4rps7d4yDM=
X-Google-Smtp-Source: AGHT+IEew7sjFWHoyX6Y6D3tw3dxh1tKP/k/G09xg9iUhwupWSCDOHHKl3pt+RSE+yOl7VXPtuGVCg==
X-Received: by 2002:a17:902:eb84:b0:1c3:62c4:7f12 with SMTP id q4-20020a170902eb8400b001c362c47f12mr176220plg.5.1697751594598;
        Thu, 19 Oct 2023 14:39:54 -0700 (PDT)
Received: from ubuntu ([122.167.60.51])
        by smtp.gmail.com with ESMTPSA id jh4-20020a170903328400b001bb9bc8d232sm182694plb.61.2023.10.19.14.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:39:54 -0700 (PDT)
Date: Thu, 19 Oct 2023 14:39:49 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <20231019213949.GA2922@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.10 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[122.167.60.51:received,209.85.214.179:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.179:from];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 96B293EFEA
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OT6YALST6LR7KH3VYF7HV7HZDAY44FSI
X-Message-ID-Hash: OT6YALST6LR7KH3VYF7HV7HZDAY44FSI
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:11 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OT6YALST6LR7KH3VYF7HV7HZDAY44FSI/>
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
 drivers/staging/greybus/camera.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index cdbb42cd413b..405c8e78aa72 100644
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
@@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(
-		struct gb_camera *gcam,
+static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
 		struct gb_camera_configure_streams_response *resp,
 		unsigned int nstreams)
 {
@@ -378,8 +377,8 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		struct gb_camera_csi_params *csi_params)
+					   struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
 	struct gb_connection *conn;
@@ -783,8 +782,9 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
 }
 
 static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
-		unsigned int *flags, struct gb_camera_stream *streams,
-		struct gb_camera_csi_params *csi_params)
+					  unsigned int *flags,
+					  struct gb_camera_stream *streams,
+					  struct gb_camera_csi_params *csi_params)
 {
 	struct gb_camera *gcam = priv;
 	struct gb_camera_stream_config *gb_streams;
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
