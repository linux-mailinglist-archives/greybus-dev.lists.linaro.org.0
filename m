Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0C7F662B
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:26:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1711E40ADF
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:26:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 0FBA83F02E
	for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 21:48:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=dQ5889a8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c9b7c234a7so16748555ad.3
        for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 14:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697924927; x=1698529727; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUY/6aiz/kuqBCZnsp6ZXSxXydVcwFjt2+x9XvheJnQ=;
        b=dQ5889a8Nu2fG/oEht4ny4IKiEDbzfqurM2mo+2WjCP5RJUsE1DzQ7m+rt2DCjX5Vz
         JK/3cfeYuRXCiGi+S4Fu2XxkpxlCN50xQiQ8g6aN4kVg9PXnOnC+1p9/9d3AKr+fHwjY
         aTmrgvT9UENAscwcCP1v2Gc7qyU6kZI9TgdEFzJJ0K0RoqIQ3NVzLQFN2l5tiZE1O8Ti
         b/VK4xIiUX4IT1VR0so3C+dtFgKPX72L5gISqdfqBKuJi70/XJ1py3nbc4NI1pMfDrCu
         EDgSAKDoqCe19bdG4QGF0pJ9n9fx4TP4Ia/9HPCX1drirHwSi7NpDyd9QfmkxYkEhe8H
         +Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697924927; x=1698529727;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUY/6aiz/kuqBCZnsp6ZXSxXydVcwFjt2+x9XvheJnQ=;
        b=djfHk3Gcfoxj1yGYkhkpnBSjEqX3L68VnJ4ak87V+I8zV5QSt6xzv5qsAA9SLlUVug
         rP0+bPxxxPsJKKa36sQ5Xf7hu3Li8V8z/Ex87K5fZQnvp90QmjPHIs98qWZWiziQnhgb
         RIy+jKAgPM/ZNRMYbwTQ8O6HHc53QTAulL+nBWnO2jNlrL7L1mqPgidVqRVhf5KQZyBH
         MpVga4WXFnYyZNsXLp5tmcoZ7015wFHZz6Tf0Iqb4f/Fx+bW//LKhPTungH15/9hEL0w
         t7UERCuxB80hLsML2Fb5qHz3XueF+/iwbsNmHwuku5Jg9ytMJB+iCSgB3J7HdVruGdZX
         PEog==
X-Gm-Message-State: AOJu0YyhZSHtQMWbXNU/V/Tnn4E4i48iT8jHwdEuFCeW/VUTdy9IeyqT
	XO/vLhKJ9MzOV3z6MYr3gXg=
X-Google-Smtp-Source: AGHT+IEZd9SN83EFFxrJuxljhGwxuZ4exyWb83Q2VVJHLmEQIDMjLqdOV1BIKqIgpjkUfG9ZCE44sg==
X-Received: by 2002:a17:902:cec4:b0:1ca:2caa:aca6 with SMTP id d4-20020a170902cec400b001ca2caaaca6mr6514621plg.68.1697924927110;
        Sat, 21 Oct 2023 14:48:47 -0700 (PDT)
Received: from ubuntu ([122.167.9.184])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001c5eb2c4d8csm3542882plg.160.2023.10.21.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 14:48:46 -0700 (PDT)
Date: Sat, 21 Oct 2023 14:48:40 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <20231021214840.GA6557@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0FBA83F02E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BP2AFFDC43CPDMAMS5E63E4VQ3JDD7KC
X-Message-ID-Hash: BP2AFFDC43CPDMAMS5E63E4VQ3JDD7KC
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:27 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: avoid macro argument precedence issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BP2AFFDC43CPDMAMS5E63E4VQ3JDD7KC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adhere to linux coding style, added parentheses around
macro argument 'gcam'.
CHECK: Macro argument 'gcam' may be better as '(gcam)' to
avoid precedence issues

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index cdbb42cd413b..ae49e37a87e9 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
 
 #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
 
-#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
-#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
-#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
+#define gcam_dbg(gcam, format...)	dev_dbg(&(gcam)->bundle->dev, format)
+#define gcam_info(gcam, format...)	dev_info(&(gcam)->bundle->dev, format)
+#define gcam_err(gcam, format...)	dev_err(&(gcam)->bundle->dev, format)
 
 static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 					  int type, unsigned int flags,
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
