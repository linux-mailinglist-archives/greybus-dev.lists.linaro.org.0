Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 155248678F5
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 15:48:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D6E9740E1F
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 14:48:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	by lists.linaro.org (Postfix) with ESMTPS id 71A4B3F3BD
	for <greybus-dev@lists.linaro.org>; Sat, 24 Feb 2024 20:21:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marliere.net header.s=2024 header.b="bE2cP/h8";
	spf=pass (lists.linaro.org: domain of rbmarliere@gmail.com designates 209.85.216.44 as permitted sender) smtp.mailfrom=rbmarliere@gmail.com;
	dmarc=pass (policy=reject) header.from=marliere.net
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-299b92948a6so1385193a91.3
        for <greybus-dev@lists.linaro.org>; Sat, 24 Feb 2024 12:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708806108; x=1709410908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipyqjxXJNlrJUdv0Iam1Q+/TnUziHOnI8o1nibDPQf0=;
        b=seRisSalQXZc74tCizKRaNSDBsEfQ/7DoQdoEAhA4aaqKwYzFjpvYOA+MiZGL43+QP
         Ar5P2j8hAD9y4tH/eXpa7FfEfCEOa0QZsdCVyarQ1Rp1vDQa6uer0lIL+rJisYGb50Ev
         818gFpjL+NjGx3zSgCQ/Nh04TOYyxWZy6475ycUuYQBnwk7ns7Ld+fdniq9Pyz6peeNh
         66xILqNJCjx2p7o8T9O+ZqkE8uJRbBXHxiRm78/HdS18ms14pzQhuHf7IUWFbFGIdnAb
         bLrzupy+faPJidFhVewgAunRzsGb9kigxlGwbiGwLPYoUTL2jKuEoslKqAhSX7VrGmbz
         2X7g==
X-Forwarded-Encrypted: i=1; AJvYcCWFabB+yX7HuJdlvBjLG42pEWrU8TueTG21JAmbp9mpRWPWqF9X27zYo0AQUeR9CEqo74FxfNznKVmoMaJc+hzac9nmvfuN4Bp2KQfK
X-Gm-Message-State: AOJu0YwPJMITrqE1qbGO8G0iJ0m73eMsRiQgEmmV+gDdH5cL3Te0JTd7
	Dzrs9wYZXVWuB61apkcgW3+1YC+PPlwTkvcwosLMhR+x8KJwfeAiiAhGaJhfm71fdQ==
X-Google-Smtp-Source: AGHT+IEB9ZAcUcWJxBZNiuJpwHkCTd/u8mb2e+ap9YQDA02JMHvrCMODH3NPu20hCv96rcjn9Tir+g==
X-Received: by 2002:a17:902:9f8f:b0:1dc:2755:16d2 with SMTP id g15-20020a1709029f8f00b001dc275516d2mr2725428plq.18.1708806108528;
        Sat, 24 Feb 2024 12:21:48 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902b78800b001db28ae5d81sm1346259pls.159.2024.02.24.12.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:21:48 -0800 (PST)
Date: Sat, 24 Feb 2024 17:22:39 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708806106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipyqjxXJNlrJUdv0Iam1Q+/TnUziHOnI8o1nibDPQf0=;
	b=bE2cP/h8/p0/ZKYP3QQ19ChoJxBA33csYHusYKf39XINlAwisC3LvRFCgp2scPkbwuHqMC
	61Eep3vtb8j5QTOdPFyfEBMdlPpIlaEOL8CC6CaJj1uyff7JB8jCevzVxTUetw+5jLkNZX
	ibOG8H6nJiRalo4j6dcRtjT+m8KiBSZzRE/da4NrlAUDTBB2WYG/MYzzq4WEKUoFJpd67h
	3nMj3SJdAhL+xhYBXRE9H2nOQz2f2V+AxAWx4OZcUk34mcvk8wtlgS8Q3fFk9sw5bamBW6
	oN76eJW87IVn/DPZGKRTytYGMRHk+6E6O9SpZF28Qkd4PrVYd6aY/ed6u8e7qw==
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Alex Elder <elder@ieee.org>
Message-ID: <ids3525jm5zkwkgizt2xtg3do37kqqtfdy5gc2cptdduexoe7r@cr4yxh3tykkh>
References: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
 <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 71A4B3F3BD
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.30 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[marliere.net,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[ricardo@marliere.net,rbmarliere@gmail.com];
	R_DKIM_ALLOW(-0.20)[marliere.net:s=2024];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.44:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ricardo@marliere.net,rbmarliere@gmail.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[marliere.net:+]
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GN72WP523ABY5QOAVHHYMKUF5LXWNHZ5
X-Message-ID-Hash: GN72WP523ABY5QOAVHHYMKUF5LXWNHZ5
X-Mailman-Approved-At: Mon, 26 Feb 2024 14:48:17 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GN72WP523ABY5QOAVHHYMKUF5LXWNHZ5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24 Feb 09:43, Alex Elder wrote:
> On 2/19/24 6:40 AM, Ricardo B. Marliere wrote:
> > Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> > core can properly handle constant struct device_type. Move the
> > greybus_hd_type, greybus_module_type, greybus_interface_type,
> > greybus_control_type, greybus_bundle_type and greybus_svc_type variables to
> > be constant structures as well, placing it into read-only memory which can
> > not be modified at runtime.
> > 
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> 
> This looks good to me.  Assuming it compiles cleanly:
> 
> Reviewed-by: Alex Elder <elder@linaro.org>

Hi Alex!

Thanks for reviewing.

> 
> On another subject:
> 
> Johan might disagree, but I think it would be nice to make
> the definitions of the Greybus device types as static (private)
> and make the is_gb_host_device() etc. functions real functions
> rather than static inlines in <linux/greybus.h>.
> 
> It turns out that all of the is_gb_*() functions are called only
> from drivers/greybus/core.c; they could all be moved there rather
> than advertising them in <linux/greybus.h>.

I guess it depends whether they would be used somewhere else in the
future. Perhaps it was left there with that intention when it was first
being developed? I agree, though. Will happily send a patch with this if
desired.

Best regards,
-	Ricardo.



> 
> 					-Alex
> 
> 
> > ---
> >   drivers/greybus/bundle.c    |  2 +-
> >   drivers/greybus/control.c   |  2 +-
> >   drivers/greybus/hd.c        |  2 +-
> >   drivers/greybus/interface.c |  2 +-
> >   drivers/greybus/module.c    |  2 +-
> >   drivers/greybus/svc.c       |  2 +-
> >   include/linux/greybus.h     | 12 ++++++------
> >   7 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/greybus/bundle.c b/drivers/greybus/bundle.c
> > index 84660729538b..a6e1cca06172 100644
> > --- a/drivers/greybus/bundle.c
> > +++ b/drivers/greybus/bundle.c
> > @@ -166,7 +166,7 @@ static const struct dev_pm_ops gb_bundle_pm_ops = {
> >   	SET_RUNTIME_PM_OPS(gb_bundle_suspend, gb_bundle_resume, gb_bundle_idle)
> >   };
> >   
> > -struct device_type greybus_bundle_type = {
> > +const struct device_type greybus_bundle_type = {
> >   	.name =		"greybus_bundle",
> >   	.release =	gb_bundle_release,
> >   	.pm =		&gb_bundle_pm_ops,
> > diff --git a/drivers/greybus/control.c b/drivers/greybus/control.c
> > index 359a25841973..b5cf49d09df2 100644
> > --- a/drivers/greybus/control.c
> > +++ b/drivers/greybus/control.c
> > @@ -436,7 +436,7 @@ static void gb_control_release(struct device *dev)
> >   	kfree(control);
> >   }
> >   
> > -struct device_type greybus_control_type = {
> > +const struct device_type greybus_control_type = {
> >   	.name =		"greybus_control",
> >   	.release =	gb_control_release,
> >   };
> > diff --git a/drivers/greybus/hd.c b/drivers/greybus/hd.c
> > index 72b21bf2d7d3..e2f3496bddc3 100644
> > --- a/drivers/greybus/hd.c
> > +++ b/drivers/greybus/hd.c
> > @@ -116,7 +116,7 @@ static void gb_hd_release(struct device *dev)
> >   	kfree(hd);
> >   }
> >   
> > -struct device_type greybus_hd_type = {
> > +const struct device_type greybus_hd_type = {
> >   	.name		= "greybus_host_device",
> >   	.release	= gb_hd_release,
> >   };
> > diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
> > index 9ec949a438ef..a88dc701289c 100644
> > --- a/drivers/greybus/interface.c
> > +++ b/drivers/greybus/interface.c
> > @@ -765,7 +765,7 @@ static const struct dev_pm_ops gb_interface_pm_ops = {
> >   			   gb_interface_runtime_idle)
> >   };
> >   
> > -struct device_type greybus_interface_type = {
> > +const struct device_type greybus_interface_type = {
> >   	.name =		"greybus_interface",
> >   	.release =	gb_interface_release,
> >   	.pm =		&gb_interface_pm_ops,
> > diff --git a/drivers/greybus/module.c b/drivers/greybus/module.c
> > index 36f77f9e1d74..7f7153a1dd60 100644
> > --- a/drivers/greybus/module.c
> > +++ b/drivers/greybus/module.c
> > @@ -81,7 +81,7 @@ static void gb_module_release(struct device *dev)
> >   	kfree(module);
> >   }
> >   
> > -struct device_type greybus_module_type = {
> > +const struct device_type greybus_module_type = {
> >   	.name		= "greybus_module",
> >   	.release	= gb_module_release,
> >   };
> > diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> > index 0d7e749174a4..4256467fcd35 100644
> > --- a/drivers/greybus/svc.c
> > +++ b/drivers/greybus/svc.c
> > @@ -1305,7 +1305,7 @@ static void gb_svc_release(struct device *dev)
> >   	kfree(svc);
> >   }
> >   
> > -struct device_type greybus_svc_type = {
> > +const struct device_type greybus_svc_type = {
> >   	.name		= "greybus_svc",
> >   	.release	= gb_svc_release,
> >   };
> > diff --git a/include/linux/greybus.h b/include/linux/greybus.h
> > index 18c0fb958b74..5f9791fae3c0 100644
> > --- a/include/linux/greybus.h
> > +++ b/include/linux/greybus.h
> > @@ -106,12 +106,12 @@ struct dentry *gb_debugfs_get(void);
> >   
> >   extern struct bus_type greybus_bus_type;
> >   
> > -extern struct device_type greybus_hd_type;
> > -extern struct device_type greybus_module_type;
> > -extern struct device_type greybus_interface_type;
> > -extern struct device_type greybus_control_type;
> > -extern struct device_type greybus_bundle_type;
> > -extern struct device_type greybus_svc_type;
> > +extern const struct device_type greybus_hd_type;
> > +extern const struct device_type greybus_module_type;
> > +extern const struct device_type greybus_interface_type;
> > +extern const struct device_type greybus_control_type;
> > +extern const struct device_type greybus_bundle_type;
> > +extern const struct device_type greybus_svc_type;
> >   
> >   static inline int is_gb_host_device(const struct device *dev)
> >   {
> > 
> > ---
> > base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
> > change-id: 20240219-device_cleanup-greybus-c97c1ef52458
> > 
> > Best regards,
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
