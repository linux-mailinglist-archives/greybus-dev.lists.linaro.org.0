Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD457F6636
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F149540ADF
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:41 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	by lists.linaro.org (Postfix) with ESMTPS id F12D53EFD6
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 12:18:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=nq8DRcl8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.210.178 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so1744251b3a.1
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697977090; x=1698581890; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PE4+6mfVrbVPnjzZCicIAFyglp4nXFWxs8H1/H4u0+Y=;
        b=nq8DRcl8DRnnm3ywvCCN4/b27fV/zjS1uqxr+xAJ5uJI3aoIjybhkVS+LttnLpEpE/
         ZhNaWbLvHm3eCvAxE7PPp5kvknZalC1VTBAxyWkRoaUyv+3lXpGX8D1NkFb2/jywR+cc
         dcgvcCEXAgUb9KJIuuyGedsI1bM3TVd+NrO/PIJkW+3N+Dh5H428J86Zj60PNCPLoTcA
         vWhkgCLeI+3KxixAbm4ZFRQcl3LD9l1bONwjpocDPPgk79Wv4JbYGo+GBQk8pdcWxF1M
         AvI7RjtQFp2TsnC1j8llMYYdY2FulP1MkZjDVBPhM6GCh/sSbUllpR3hPLEcyytUUWEE
         zyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697977090; x=1698581890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE4+6mfVrbVPnjzZCicIAFyglp4nXFWxs8H1/H4u0+Y=;
        b=G4j6BT2TPjaPxPuyIp2W/R1QN1fGm3BS4206Ii0+qXYmp+xsg9jndXjY3ePy71a34h
         1RoF+IltigFqbHK6IAFGQdXgFFQT5L6acLHSZtaU4b1KVboxJpSXD0c/t71j5T+iKVAM
         GK2E5gRSAsk1e0vaKdFRST6Tm7UxLQFGrOMKzBdGr7sTxXeNJ0piOf6wyvFiGnd3MEmq
         WgXnwMEibxZ0vAFzqWdRDZJi4XzkAIcucMXIZYf2KW+IG4d8kMATdZfCpK3RX6UfS15x
         e/E3yj3anpzl+tjEJYQNm7xahSfG+UwnbVsQv23YoZCvUZ1Awp23OG6es1jXX7gaO+QQ
         oUzQ==
X-Gm-Message-State: AOJu0YxnU0lFe637czxLdNyS39PrqA+KFTEBSQmvQIe8x466qHg5vrfy
	rnOQLSWtt1gAeyPNnb0nLsY=
X-Google-Smtp-Source: AGHT+IE8H30sWK+Ba1pN9DY8WJX2lDbNtDqXWBEsdV+UbFfQ0u9AgPoZsSFH8lJmSevKs6+8uTVHPQ==
X-Received: by 2002:a05:6a00:9398:b0:68b:a137:3739 with SMTP id ka24-20020a056a00939800b0068ba1373739mr5872707pfb.4.1697977090042;
        Sun, 22 Oct 2023 05:18:10 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id t3-20020a6564c3000000b005ac384b71cbsm3599506pgv.60.2023.10.22.05.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:18:09 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:18:01 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <5f63b332c83f5f0e95f59e673b0292c27fecb411.1697976302.git.nandhakumar.singaram@gmail.com>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F12D53EFD6
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.178:from];
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
Message-ID-Hash: TVVBC7FPYZLNC4VMDY7UTRZQFHH5BIDI
X-Message-ID-Hash: TVVBC7FPYZLNC4VMDY7UTRZQFHH5BIDI
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:54 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/3] staging: greybus: camera: Modify lines end with a '('
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TVVBC7FPYZLNC4VMDY7UTRZQFHH5BIDI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Lines should not end with a '('

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 6516e7efaab9..40d3b8aca8f0 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
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
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
