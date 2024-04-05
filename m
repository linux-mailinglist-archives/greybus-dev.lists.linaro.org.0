Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1036789C7CD
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 17:08:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 96EC844349
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 15:08:10 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	by lists.linaro.org (Postfix) with ESMTPS id 4AD8C43FEA
	for <greybus-dev@lists.linaro.org>; Fri,  5 Apr 2024 21:22:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Io8Zvhl8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of jacksonchui.qwerty@gmail.com designates 209.85.214.173 as permitted sender) smtp.mailfrom=jacksonchui.qwerty@gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dff837d674so23525965ad.3
        for <greybus-dev@lists.linaro.org>; Fri, 05 Apr 2024 14:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712352126; x=1712956926; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=usb2eToxZqr2+tKAK3YBZ5ATHfFIYXjx4gZa/I7hs4w=;
        b=Io8Zvhl8L7gcwEyZ28sMYQIXXy9KItADy0rsQu7/iSCWPbN6kLXTzEwD64Dp8UXNmu
         VtqEij3a1Crr+RM9ipOXzJRoUZBjvxbwPxK67bmQlisTPUfGVZAzcZ35ne34QMquTgz9
         AIAdfnldrhAOXqWsumD10q6VWa8W5M7jeGsyig8CJ30LFKXh5KfFTZWiK8rIdP7AlPEj
         1ry7zXiKSdseKJP0+EOwCpUWaIz6wYc0LgU94BXga203Vmr0aGWsadVrWYXM/MZ9bmOI
         Yd1DGRe2VwMQzVXzi/uaw4i77gQ0LxROnAyhk+rB8ZYBZdmBJGcXAlEuC+5E4ORNXVgD
         0ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712352126; x=1712956926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usb2eToxZqr2+tKAK3YBZ5ATHfFIYXjx4gZa/I7hs4w=;
        b=QLA+Ouo0Uyt65CXo70Q5/tBXCW4Ic3DfVfQXbxQpKkFNDfW5KPf6BXenbCggzvnp6u
         exuiTwJC32JmYUEmblDMRMIMopd6gkvGtjCOBfalK9IkQbfv4K1pc+sm9KmoCIq7xhia
         EKdZr3kCV2bjkDL9BUEQttpcCSAGWctvSLzdHKI6vGRYUMMce1o2uIFo0iVPEGAjtL9o
         iRcQahJNjwOPu2M2ubVKoIrceRFUItCLv65oHO1eUBgF8Vi18C5N5I2EN15IwQfvbcvP
         QBMt/gwdCG6nZJCis0y4p/8FQukMT/KaXEm9mpXBft1v8cpnhC0bW6tBDhH9FDluXo32
         fEzw==
X-Forwarded-Encrypted: i=1; AJvYcCXVYRQrweitISOfXc6xehHW0lkdVqWPeyQoJgxM0Th4DfTLbw1dy1dXQZGI4nYba57TC9uMkmHBmKqWlm+VtK9NgexEwbfXG4u/sUKg
X-Gm-Message-State: AOJu0YwXYCoIJRkYhPPie6CFfS1OwEFQPOKXzx5XHncBsGnsMIAP9Epl
	YpWSaoviP45NeKscLggSVIUaGk02wGBTcYrs8G14IpYopAsYKW9P
X-Google-Smtp-Source: AGHT+IG8uZKBY56GrIfR0tYPyGgVCIFZ6EmnJZmso58ECHQNdnyePLWbLj7ian9poAK/ZbsgkisM0g==
X-Received: by 2002:a17:902:82c7:b0:1e0:2995:c330 with SMTP id u7-20020a17090282c700b001e02995c330mr2413480plz.63.1712352126269;
        Fri, 05 Apr 2024 14:22:06 -0700 (PDT)
Received: from jc-ubuntu-dev-korn-1 (c-98-210-1-68.hsd1.ca.comcast.net. [98.210.1.68])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b001e0ea5c910dsm2075113plg.18.2024.04.05.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 14:22:05 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:22:05 -0700
From: Jackson Chui <jacksonchui.qwerty@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
X-Rspamd-Queue-Id: 4AD8C43FEA
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.173:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: jacksonchui.qwerty@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: I3AY3JVKJNY7GILTIQ5MWG7ZYZ2XLCGD
X-Message-ID-Hash: I3AY3JVKJNY7GILTIQ5MWG7ZYZ2XLCGD
X-Mailman-Approved-At: Mon, 08 Apr 2024 15:08:08 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I3AY3JVKJNY7GILTIQ5MWG7ZYZ2XLCGD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
> On 4/3/24 7:16 PM, Jackson Chui wrote:
> > Reported by checkpatch:
> > 
> > CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> > precedence issues
> 
> I agree with your argument about the way the macro should be
> defined.  But perhaps these gcam_*() functions could just
> be eliminated?
> 
> I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
> to gcam_info().  It would be a different patch, but maybe
> you could do that instead?
> 
> 					-Alex
> 
> 
> > 
> > Disambiguates '&' (address-of) operator and '->' operator precedence,
> > accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> > 'struct device*', which is required by the dev_{dbg,info,err} driver
> > model diagnostic macros. Issue found by checkpatch.
> > 
> > Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> > ---
> >   drivers/staging/greybus/camera.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > index a8173aa3a995..d82a2d2abdca 100644
> > --- a/drivers/staging/greybus/camera.c
> > +++ b/drivers/staging/greybus/camera.c
> > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> >   #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> > +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> > +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
> >   static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> >   					  int type, unsigned int flags,
>

Thanks for the feedback, Alex!

I thought about refactoring it, but I feel it is worth keeping
the macro around. It acts as an apdater between callers, who 
have 'gcam' and want to log and what the dynamic debug macros 
expect. Without it, the code gets pretty ugly.

Jackson
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
