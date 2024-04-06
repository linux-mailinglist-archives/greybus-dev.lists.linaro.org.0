Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186989C7D1
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 17:08:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 00DB944349
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 15:08:20 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	by lists.linaro.org (Postfix) with ESMTPS id E3721400E1
	for <greybus-dev@lists.linaro.org>; Sat,  6 Apr 2024 22:35:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=l4xrrp9I;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of jacksonchui.qwerty@gmail.com designates 209.85.222.176 as permitted sender) smtp.mailfrom=jacksonchui.qwerty@gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78bc322a55cso217008885a.1
        for <greybus-dev@lists.linaro.org>; Sat, 06 Apr 2024 15:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712442924; x=1713047724; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjHnM6vQHjQJFOGaXPhz8ZI07k2GyCIqt2D6nyEj5Bc=;
        b=l4xrrp9I1fmynL4i9WJMv4RpxzqHwM+rQu1MSmtNwu06W+lpHWdWWxkU3O7ph7VGdi
         u2q1aP31lvG2iaRG7dUuO58+6VbSTGjR1xRYAT7GfrZWPUo6QVpRncHKm2plSdi0NVBy
         yc85/4Fzsul9NShQXTnqUZPgPEVPtCOn79AfUXcc0jeKzuuvP5bqmjSNpZDnDbVI+ImV
         DS4Om25Tdgj4xCI4wcBpXzTXGA/lc/yymz5cl5Fmb6Vt+/2XtuAkTURrIyEIUv8LGywT
         2uBNP6j2mxn3mITGXpIwr/6THTWZ03zgRN9un6pyO1bp0xY/rXPmSsXEb/i8nFmkSJYl
         g40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712442924; x=1713047724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjHnM6vQHjQJFOGaXPhz8ZI07k2GyCIqt2D6nyEj5Bc=;
        b=Ib/AHxUug0ToPpM+XO0BGIkMgHPmD3GPGzrZpxtf3I5NNy64DHaqeGlE3ezn9F7+XH
         oHA/qvrh2fqZ5/mbb9HQzevXW5phXasKUoB5bqa3+KkZLLEqKv6tqnA7Wj2WSEdoPIn2
         xIOZQzDlNN+ZO4t15NZlvCYJ3E+JlQU+Nd7vt1qKed+vXHK0gviPyYOi7Dy77cfQrYiW
         ev5WSmv4BbxOcydJiYBOMVrOe+Ueha+BVKFosfGxU3UeiTWmw804cC+Ry+liQLzbMzI7
         jxhlmwBFy/3jloF2imWhOGbSIUiVRyiLLKf8nBXAiKi8/978xZjR6ThLfMDWjIlaMLBR
         LSEA==
X-Forwarded-Encrypted: i=1; AJvYcCWas194Z6745Le/USpCGWOUx+jO0jn5SRU9/HqQ94Hj/Cipzia9kjCQ5kHTxW3N1tOr6+y+nDN+lF7OoENPbmkmjQkP9WzGZaJAYzN9
X-Gm-Message-State: AOJu0Yy3MclwtkHn1ap8t4j8ZlPdtF/OGBUWBvYSDt1SOJVGe5KQgetN
	FY8hlYHJ969I1874zcrheCPMePGeFYHHP+DyKR4vo1VVo5lVG/zH
X-Google-Smtp-Source: AGHT+IEkvgy8+qUt0j8Xfe01Nb9Ngkcf/YUBeFTPPedadUYM/B+HYCGUUeSyvLy371dBR4zqX5Mrhw==
X-Received: by 2002:a37:e20b:0:b0:78d:52e6:5136 with SMTP id g11-20020a37e20b000000b0078d52e65136mr3023912qki.51.1712442924469;
        Sat, 06 Apr 2024 15:35:24 -0700 (PDT)
Received: from mba15m2.local (pool-68-134-50-197.bltmmd.fios.verizon.net. [68.134.50.197])
        by smtp.gmail.com with ESMTPSA id g22-20020ae9e116000000b007882fe32acasm1801841qkm.3.2024.04.06.15.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 15:35:24 -0700 (PDT)
Date: Sat, 6 Apr 2024 18:35:22 -0400
From: Jackson Chui <jacksonchui.qwerty@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <ZhHOKkqVIdsuZ-4Q@mba15m2.local>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
 <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
 <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>
X-Rspamd-Queue-Id: E3721400E1
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.176:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: jacksonchui.qwerty@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6SP2FS2EJMJFKG6H75XJ5NY6DN3JSBHL
X-Message-ID-Hash: 6SP2FS2EJMJFKG6H75XJ5NY6DN3JSBHL
X-Mailman-Approved-At: Mon, 08 Apr 2024 15:08:08 +0000
CC: Dan Carpenter <dan.carpenter@linaro.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6SP2FS2EJMJFKG6H75XJ5NY6DN3JSBHL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 06, 2024 at 11:45:51AM -0500, Alex Elder wrote:
> On 4/6/24 4:09 AM, Dan Carpenter wrote:
> > On Fri, Apr 05, 2024 at 02:22:05PM -0700, Jackson Chui wrote:
> > > On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
> > > > On 4/3/24 7:16 PM, Jackson Chui wrote:
> > > > > Reported by checkpatch:
> > > > > 
> > > > > CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> > > > > precedence issues
> > > > 
> > > > I agree with your argument about the way the macro should be
> > > > defined.  But perhaps these gcam_*() functions could just
> > > > be eliminated?
> > > > 
> > > > I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
> > > > to gcam_info().  It would be a different patch, but maybe
> > > > you could do that instead?
> > > > 
> > > > 					-Alex
> > > > 
> > > > 
> > > > > 
> > > > > Disambiguates '&' (address-of) operator and '->' operator precedence,
> > > > > accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> > > > > 'struct device*', which is required by the dev_{dbg,info,err} driver
> > > > > model diagnostic macros. Issue found by checkpatch.
> > > > > 
> > > > > Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> > > > > ---
> > > > >    drivers/staging/greybus/camera.c | 6 +++---
> > > > >    1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > > > index a8173aa3a995..d82a2d2abdca 100644
> > > > > --- a/drivers/staging/greybus/camera.c
> > > > > +++ b/drivers/staging/greybus/camera.c
> > > > > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> > > > >    #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> > > > > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > > > > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > > > > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > > > > +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> > > > > +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> > > > > +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
> > > > >    static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > > > >    					  int type, unsigned int flags,
> > > > 
> > > 
> > > Thanks for the feedback, Alex!
> > > 
> > > I thought about refactoring it, but I feel it is worth keeping
> > > the macro around. It acts as an apdater between callers, who
> > > have 'gcam' and want to log and what the dynamic debug macros
> > > expect. Without it, the code gets pretty ugly.
> > 
> > Another idea would be to create a function:
> > 
> > struct device *gcam_dev(struct gb_camera *gcam)
> > {
> > 	return &gcam->bundle->dev;
> > }
> > 
> > 	dev_dbg(gcam_dev(gcam), "received metadata ...
> > 
> > (I don't know how to actually compile this code so I haven't tried it).
> 
> Yes, I prefer this over the original suggestion.  But
> even here the gcam_dev() function doesn't add all that
> much value; it saves four characters I guess.
> 
> Jackson, the basic principle that makes me say I don't
> like the wrapper macros is that the wrapper obscures
> the simple call(s) to dev_dbg(), etc.  If there was
> something you wanted to do every time--along with
> calling dev_dbg()--then maybe the wrapper would be
> helpful, but instead it simply hides the standard call.
> Better to have the code just use the functions kernel
> programmers recognize.
> 
> 					-Alex

Dan, Alex I think both of you are spot on.

I like the suggestion of adding 'gcam_dev()' as an accessor
function and directly calling to 'dev_*'. I'm busy this weekend
but will send out a new patch with this change next week.

Jackson

> > 
> > regards,
> > dan carpenter
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
