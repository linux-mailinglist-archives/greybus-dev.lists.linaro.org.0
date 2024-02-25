Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171F8678F9
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 15:48:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4EAAB40D80
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 14:48:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id 999023F087
	for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 11:03:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marliere.net header.s=2024 header.b=ocdENja4;
	spf=pass (lists.linaro.org: domain of rbmarliere@gmail.com designates 209.85.214.171 as permitted sender) smtp.mailfrom=rbmarliere@gmail.com;
	dmarc=pass (policy=reject) header.from=marliere.net
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d94b222a3aso23076655ad.2
        for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 03:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708859021; x=1709463821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15Blst29HGQPopSfvgIrNbaX0gzGv9i907KA2hfl4tk=;
        b=KGgyj/gS7LelgSrDs9gl4/7yIU09xezvFPnwKDHicLAxeXsbscIiyRmybl9w8p2NaJ
         N548u0J6gopkAVQ28WDejP7vuRjskDOo/rgmrRdg5OvbGfREd3Tx1ruwQ2s9bZ1rRX1I
         ut9yNqbfuL2fv2fVGLjmnJWgoIvwnKFpB8d8GahlI//5h4z+DSuz5ZyBF9cwTuE9zcln
         jLuDqFSMMRqVlXDY12DiLM1WycVyURg0vqsBXR8EM+mN36NtL6thCJRACRvIW0qvyglK
         sWAbehDu6YnlngnG93kLWetnCfaD/8gYzNYP2ehzntkoTdc3C6T1DMAZxdKRx9E5xFuR
         GhXg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6JgNnG+slrSCz0QsGhcqcRbjZSM3zRx8vXw/HlRF9qoCG3ijRkVMmyy1Jnl4z0EAdQF6ShmrC3Acxbw0xho6KdByJxqx4UygMEYg
X-Gm-Message-State: AOJu0YyhxVWEP0TUymkoGsCx/gr6hSCK9YS7/AVxJDfCvPEvE68wt3NM
	bZmtw68hITA3W/g2gqdVMbyPMt/Cm5JeA87GtMx/jiIulCcwaygA
X-Google-Smtp-Source: AGHT+IELd7l6EyoDFaFNGZC5uZbM1lQMJV0IFeOzxE7P/kBORfB2Op/gCFMV0iEmD5oxOQZ9P/9M1A==
X-Received: by 2002:a17:902:dac9:b0:1dc:623d:1c3f with SMTP id q9-20020a170902dac900b001dc623d1c3fmr6537152plx.6.1708859020584;
        Sun, 25 Feb 2024 03:03:40 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902ee5500b001db337d53ddsm2096075plo.56.2024.02.25.03.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 03:03:40 -0800 (PST)
Date: Sun, 25 Feb 2024 08:04:29 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708859018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15Blst29HGQPopSfvgIrNbaX0gzGv9i907KA2hfl4tk=;
	b=ocdENja46D86FdLm2EarmlZS4PgyoWsVIdnZ93d37/F21HD68dZ7RNKI3B7j1a5AxAzDJt
	KOdQIv20ECLNa8GC7L62qFh6VCg84LtkGvbHCWZnDkRbSBaFvrXtAfoyMn7DSZay0G7TYn
	CECcZEZgbEzLd5Xnd81953pSQeHA3k3PV8JxjHE3pzHK6gG3OC1ey/8s9b7GM519Gljetj
	Fh3376sZrnEoB60Kn8UApdsXcT/6xp4UEERp4mX9CxxOJA+4C6dvQc3sQsPHw5hGlXL+Jk
	galLyTs23wLBpGAmG0jJ6WNvC0TDgmkDchAn2EjZ1Eq1RDiL6YqmBeWrz8fWtA==
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <yru2ywkyqwhg3rpyuqkkx73fxkkgsfj3vcbttnzrjq662ctrov@boh65bhxjjgo>
References: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
 <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
 <ids3525jm5zkwkgizt2xtg3do37kqqtfdy5gc2cptdduexoe7r@cr4yxh3tykkh>
 <2024022553-deepness-sublevel-73de@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024022553-deepness-sublevel-73de@gregkh>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 999023F087
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.20 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[marliere.net,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[ricardo@marliere.net,rbmarliere@gmail.com];
	R_DKIM_ALLOW(-0.20)[marliere.net:s=2024];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[marliere.net:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[ricardo@marliere.net,rbmarliere@gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[209.85.214.171:from,24.199.118.162:received];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
	RCPT_COUNT_FIVE(0.00)[6]
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XY7ATRYF3KRYKH3RO5YVON62EPYFDCQC
X-Message-ID-Hash: XY7ATRYF3KRYKH3RO5YVON62EPYFDCQC
X-Mailman-Approved-At: Mon, 26 Feb 2024 14:48:19 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XY7ATRYF3KRYKH3RO5YVON62EPYFDCQC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25 Feb 09:33, Greg Kroah-Hartman wrote:
> On Sat, Feb 24, 2024 at 05:22:39PM -0300, Ricardo B. Marliere wrote:
> > On 24 Feb 09:43, Alex Elder wrote:
> > > On 2/19/24 6:40 AM, Ricardo B. Marliere wrote:
> > > > Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> > > > core can properly handle constant struct device_type. Move the
> > > > greybus_hd_type, greybus_module_type, greybus_interface_type,
> > > > greybus_control_type, greybus_bundle_type and greybus_svc_type variables to
> > > > be constant structures as well, placing it into read-only memory which can
> > > > not be modified at runtime.
> > > > 
> > > > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > > 
> > > This looks good to me.  Assuming it compiles cleanly:
> > > 
> > > Reviewed-by: Alex Elder <elder@linaro.org>
> > 
> > Hi Alex!
> > 
> > Thanks for reviewing.
> > 
> > > 
> > > On another subject:
> > > 
> > > Johan might disagree, but I think it would be nice to make
> > > the definitions of the Greybus device types as static (private)
> > > and make the is_gb_host_device() etc. functions real functions
> > > rather than static inlines in <linux/greybus.h>.
> > > 
> > > It turns out that all of the is_gb_*() functions are called only
> > > from drivers/greybus/core.c; they could all be moved there rather
> > > than advertising them in <linux/greybus.h>.
> > 
> > I guess it depends whether they would be used somewhere else in the
> > future. Perhaps it was left there with that intention when it was first
> > being developed? I agree, though. Will happily send a patch with this if
> > desired.
> 
> Let's clean the code up for what we have today.  If it's needed in the
> future, we can move the structures then.

Sounds good to me, will send a v2 then!

Thank you,
-	Ricardo.


> 
> thanks,
> 
> greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
