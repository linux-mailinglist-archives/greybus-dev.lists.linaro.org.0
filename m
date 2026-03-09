Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rvSCEiBEr2n3TAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 23:05:20 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8612420C5
	for <lists+greybus-dev@lfdr.de>; Mon, 09 Mar 2026 23:05:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6AB34015E
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Mar 2026 22:05:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	by lists.linaro.org (Postfix) with ESMTPS id 38D2F3F9BE
	for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2026 22:05:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=ZFU+IPYU;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.48 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540355459so9168915e9.3
        for <greybus-dev@lists.linaro.org>; Mon, 09 Mar 2026 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773093915; x=1773698715; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sh1/MPGVOz0ssapVsSFxczXDSSRPJy6NxkgRJpIQR1c=;
        b=ZFU+IPYUeHg/LCnyvaSig7oNdLMCnbALqVBsctrHlX/jsS6IZcXISlPIrc3mjit4ED
         hE425Mh0PIa7c8fLlYLKZn0xZJKbKkB87mo8F4+X2iJklt8yKx/pjalRPwhvW+30YpO/
         6RedLcGVzQliMXTh1oVmLSGiCH41/TOvKYPRfidfZNShY/Oz9R6dP7omf7EWUmILVSFH
         vHnnryRC57jD2LJJO+Q2uT0S8KW4aW6SVo4V2nge/7OVkwY/Lj7emputSL/K4rZvguJ3
         THNBqdHExbLjPjIdJWN/ZGBbgFi5VlASv8Qp7IEwJwp2QM7C/TxtbHqpPMLB4RqtAatz
         MACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093915; x=1773698715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sh1/MPGVOz0ssapVsSFxczXDSSRPJy6NxkgRJpIQR1c=;
        b=ofMq8MqWHWwTWHrfwVRGW6JQfXICb2Zd6N9OKco002pHOpUKhNwX8utAvr7Gf/Zbli
         KuC4+P2xRfa4h20ym9GpAPiplR2B7veum1JAQZ159sSxnQXSIPi0b+MeUJHdPp5iIOYC
         yVyYOyOWj8FDNVO1GV4wCSpORG/SRgmTuwoYHJut0dccBy2v5nQAV91aOFUzQdzihbPQ
         TI+RngpWTiyxZx+4f0bYPMfhTxZTLoIZY6gwjnKnBRNLN95tB7zZmrviyE+ilObGuY86
         41dizov4cUMZHg9iB8fQUAvHM+Izc6RM1BnKqxgmw6fhAfG+5417eU7rp5edMzDl3eMC
         jmEg==
X-Forwarded-Encrypted: i=1; AJvYcCX9IGezHypaFy9y1qCOqVlWT1ZD0BvR7mVP2TRZ/Z4E/4tcdZXf8s7twIrjr0GBFC77vN77J4oNZLA/IA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzyKmRB+vJ9u5kTXiubnJI5dlYd2DRwthITUmSwUmlsaUiPlNen
	2sJhgteov3Y2ZKItsoZUQaJwn1K786iUhFbCcetiLjKSYaQxAPfe1O+v+sXIZKuE66fyng==
X-Gm-Gg: ATEYQzw6CGgfJTHusijBshQ+Xzn0+9T4A6pBRfsB5pgfCICIg1lE+sBTIjVwQXb1Fr3
	78CyxkRtC8oVtNUWe20paeNyB7n8TeXAtplQ3Si3P6Kbpx76PzivKO1c8EnzZVMr5DGqqUXxtxT
	w2Q/MapLODS08shZkXmMBSt0lRtk85RIHlUdg4av7glL28y3D9a8w4iIltI3a3bfkzu+rUJviHF
	x7neNybpEAIGRM069VnrZt7U+7YSR6uzBXljgzsT3DlJ5OeEqTmTtgwuGCdLzkHDnVfefveEG1G
	d+gLc9zkemPYJS9qhRTvTATtrP6YWn1w2MxCVKepaFrGMzQl8ljrovZ1GdFbOhaNmRrBO8dvdil
	PkU6zkUV/S0k52Sg//Ci2TjYZua50hVteBJbNF3DPBxI7pQL/WL1Fs/zpQfpiFF0plY8TSdgf+d
	GRFHGXD1EuGN8+QKAFvJ3Lo9hMrZXn
X-Received: by 2002:a05:600c:310f:b0:485:390d:74f1 with SMTP id 5b1f17b1804b1-485390d76ebmr93464035e9.13.1773093914913;
        Mon, 09 Mar 2026 15:05:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a6bbcesm23594395e9.3.2026.03.09.15.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:05:14 -0700 (PDT)
Date: Tue, 10 Mar 2026 01:05:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Soza Rodriguez <luistermc789@gmail.com>
Message-ID: <aa9EFyfi9iprkQzi@stanley.mountain>
References: <20260309165522.26388-1-contact@sluisr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309165522.26388-1-contact@sluisr.com>
X-Spamd-Bar: ----
Message-ID-Hash: 4WHXS3N3OUXOOXXCKPSB22TEACN2QFFV
X-Message-ID-Hash: 4WHXS3N3OUXOOXXCKPSB22TEACN2QFFV
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Luis Soza Rodriguez <contact@sluisr.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: use sysfs_emit in sysfs show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4WHXS3N3OUXOOXXCKPSB22TEACN2QFFV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BF8612420C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.738];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linaro.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email,sluisr.com:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 10:55:22AM -0600, Luis Soza Rodriguez wrote:
> As per the kernel's documentation, sysfs_emit() is the preferred way
> to format strings for sysfs attributes. It handles buffer overruns
> safely. Replace sprintf calls with sysfs_emit across all loopback
> sysfs show macros.
> 
> Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
> ---
>  drivers/staging/greybus/loopback.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index aa9c73cb0..3a502d89d 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -125,7 +125,7 @@ static ssize_t field##_show(struct device *dev,			\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%u\n", gb->field);			\
> +	return sysfs_emit(buf, "%u\n", gb->field);			\
>  }									\
>  static DEVICE_ATTR_RO(field)
>  
> @@ -137,8 +137,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
>  	/* Report 0 for min and max if no transfer succeeded */		\
>  	if (!gb->requests_completed)					\
> -		return sprintf(buf, "0\n");				\
> -	return sprintf(buf, "%" #type "\n", gb->name.field);		\
> +		return sysfs_emit(buf, "0\n");				\
> +	return sysfs_emit(buf, "%" #type "\n", gb->name.field);		\
>  }									\
>  static DEVICE_ATTR_RO(name##_##field)
>  
> @@ -158,7 +158,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  	rem = do_div(avg, count);					\
>  	rem *= 1000000;							\
>  	do_div(rem, count);						\
> -	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
> +	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>  
> @@ -173,7 +173,7 @@ static ssize_t field##_show(struct device *dev,				\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%" #type "\n", gb->field);			\
> +	return sysfs_emit(buf, "%" #type "\n", gb->field);			\

Please, keep the \ characters aligned properly.

>  }									\
>  static ssize_t field##_store(struct device *dev,			\
>  			    struct device_attribute *attr,		\
> @@ -199,7 +199,7 @@ static ssize_t field##_show(struct device *dev,		\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%u\n", gb->field);				\
> +	return sysfs_emit(buf, "%u\n", gb->field);				\

Same.

>  }									\
>  static DEVICE_ATTR_RO(field)
>  
> @@ -209,7 +209,7 @@ static ssize_t field##_show(struct device *dev,				\
>  			    char *buf)					\
>  {									\
>  	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sprintf(buf, "%" #type "\n", gb->field);			\
> +	return sysfs_emit(buf, "%" #type "\n", gb->field);			\

Same.

regards,
dan carpenter

>  }									\
>  static ssize_t field##_store(struct device *dev,			\
>  			    struct device_attribute *attr,		\

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
