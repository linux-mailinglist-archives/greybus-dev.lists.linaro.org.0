Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4857F6630
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D016340AD4
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:12 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	by lists.linaro.org (Postfix) with ESMTPS id 40C183EC22
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 10:41:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=msBCHwQG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.160.53 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e9c9d181d6so1717149fac.0
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971262; x=1698576062; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ULEzVLtQ2S1zar/fvv2bvXuBMfVambqe7uOvKdP1z6k=;
        b=msBCHwQGo+jmbn1RIAEzsddlyDTkwvvUzEQFht/1F5APPI7VH/WCjOoAik9J6HKRRX
         ha7VfVSgNh82Q8pYHymTZhxY1belDJlOdDTznpgw+AYmB9QZ8dGvBWDjgn0isOOETPTf
         epdHYR2ykLyILbH0uMNODH7I6PikbX8V/GePJq5mFROh6H3mlY0W8bNIuCxZlme/tI4W
         wQXbla3yUfW73gXbvcEkfrrfg4iCgZMChnknUQfOybTLPAXQkt43s5vRh7TWAjRcDZOl
         9P5SyO7wI4tFBJ15eET6JUQ878xb3XpdiKrISbpzw5b172bWwFXH81FvZodqkFWLx+6s
         Z01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971262; x=1698576062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULEzVLtQ2S1zar/fvv2bvXuBMfVambqe7uOvKdP1z6k=;
        b=CWVx2r8HGntaj9Nc46+GspGMVaLK0QhcOU3oh+A1b5Slr09IImDcZKv8htbHjWaRHQ
         nK0mkxs9o9QpbvNSabh23pU/gMZz2jsoC35nnweeaq0o344lhT4Onp8FaImsPsiafxoR
         gCpGTJ+ymOzGgVjYBO6cCaqTn468XBuVVcCY8+aHf2QOvQHJCbI4fQlzNCQ6LM0e6ON2
         CzUoh3rq/1ie7cG7Bd5Wik750sTr5cpKeiK58fwwth0IQICApxFOfTLOfFF0ph4uQ46y
         OPWEEQGvDNJCW9shYKpByxK3XQIRiIXxpTdE5EQAZEG7Qva+BUiD+1+iRVB6EQFn4xFU
         kbqA==
X-Gm-Message-State: AOJu0YzREDzvecWBAWL5gkWsmWfO0QoMCnDSttY6JP/zdxst4FAFGXUr
	xTztjQtifTeSh3kpSaNrOcFRtgmd/z8eXA==
X-Google-Smtp-Source: AGHT+IFgN6/PaswmdUmoqw2OMJKkJCHNeJYp4Hh9ngYJEtLETOtJL7TF5JNX82LpM4SpUYilirG8Tw==
X-Received: by 2002:a05:6871:800a:b0:1e9:f69a:1302 with SMTP id sk10-20020a056871800a00b001e9f69a1302mr6764712oab.48.1697971262607;
        Sun, 22 Oct 2023 03:41:02 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id o21-20020a17090aac1500b00277246e857esm5781338pjq.23.2023.10.22.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:41:02 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:40:57 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <57d7aa177d58384bcc178f6722a8f7f6af78a536.1697969950.git.nandhakumar.singaram@gmail.com>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 40C183EC22
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.53:from];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AW4YMRSCNMTJZBIDHGC73CCV2BT7GVNK
X-Message-ID-Hash: AW4YMRSCNMTJZBIDHGC73CCV2BT7GVNK
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:51 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AW4YMRSCNMTJZBIDHGC73CCV2BT7GVNK/>
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
index feddceddffbb..40d3b8aca8f0 100644
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
@@ -377,8 +377,8 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		struct gb_camera_csi_params *csi_params)
+					   struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
 	struct gb_connection *conn;
@@ -782,8 +782,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
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
