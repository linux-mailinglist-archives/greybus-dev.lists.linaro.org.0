Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEAE89A9D1
	for <lists+greybus-dev@lfdr.de>; Sat,  6 Apr 2024 11:09:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BFDF44415D
	for <lists+greybus-dev@lfdr.de>; Sat,  6 Apr 2024 09:09:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by lists.linaro.org (Postfix) with ESMTPS id C2B8D400D7
	for <greybus-dev@lists.linaro.org>; Sat,  6 Apr 2024 09:09:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=yUMLkCl6;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a44f2d894b7so357906166b.1
        for <greybus-dev@lists.linaro.org>; Sat, 06 Apr 2024 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712394550; x=1712999350; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jsux2xNdM5INUuabTGtcNgAbopGLxo1c/2XpNOGaEWM=;
        b=yUMLkCl6whODlwMrjA08P1hduYnBGAOQGRMlVx8OcMTcW9pWROnbQqy2xq9Ds0Qwte
         FarX58ZFPEAvStVM3qRtobvGz1MonZIpo3E+visuxdRskJqk5M+xUgMgGauIm0v+stb5
         LEImSB43CbHKyid7HxL3MK7bAMLHVNaf4UP2C0z42pSQv6QczNRAqSTZr/pNS8dFTDc0
         eH+CrQc08tKQx5YkCTyKtPmYkfMJ6ugt/CDON7EVbwRxJotd0VQHf0wiKxTyVf/8kM0a
         g0JUhJI07S95nMUU8gzkDbRoKOSn+C7X1bTsEVMOsPW5ivflg7H8WTt/NOhbxzgw2HNP
         58+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712394550; x=1712999350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jsux2xNdM5INUuabTGtcNgAbopGLxo1c/2XpNOGaEWM=;
        b=Of5NUYfHtqt3JsQ2ca/+DGbAN7AaOBZT5ada0OoYHAjkhtUGqRseIRct8pa/4lPMr4
         YrOoshHj6c/tpxhMymuacuEn8TBMmI3Jt2owbJ2dMUyx3tqNFahpelnkYXwuUiP5Mrjv
         fAcEgm6dlhcvwmElLKqT4j+5UmT4//MjqpRI89tjSFodJ6/w2FljKS05T+pHR01qdTDj
         zP5VadgRsQbn2IGTbnQt6k0z6i6jeuduW/tPd90P8+eh5j/e38fPgh16Ne6jSLSFbBpS
         dF2dWVimDvt7ZNrses3Y44SdFC0a+Pjdmdx2keJn7c2AgfOjVz+UrKX5FwAElHrWQmnz
         Ri7w==
X-Forwarded-Encrypted: i=1; AJvYcCWJgsG9GVB4P66yo81G+FqxSPASKCNdQMihyF37R4hhMdhQk3VivH77QWxmqUzkya+lPbxaqOtavF1sthaTzRNJcdpJFZIjueQhyT1e
X-Gm-Message-State: AOJu0YxuYqJSB+tftGlmCyWEMiyIIgqfKtr7xsWLswDJhxFRwY3Wn/mO
	q5EVfbfVYmXrJsFlwkkwZXsSGjE0lsbs7FFvkBpX3FIFiT19J6oRlDwwO616JTJ7RA==
X-Google-Smtp-Source: AGHT+IEePUKy6Exi4dt9+UbvFkTbfuWJlF40HE36cWG7zX6sCHC690fGxSptBYpyD+e0u3AVoM6UgA==
X-Received: by 2002:a17:906:2e98:b0:a4e:390f:c6ce with SMTP id o24-20020a1709062e9800b00a4e390fc6cemr2533620eji.65.1712394549323;
        Sat, 06 Apr 2024 02:09:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id he8-20020a1709073d8800b00a4e57805d79sm1785409ejc.181.2024.04.06.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 02:09:08 -0700 (PDT)
Date: Sat, 6 Apr 2024 12:09:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
Message-ID: <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
X-Rspamd-Queue-Id: C2B8D400D7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.54:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: M6A2RDNI7DCPAH4ZRUT3ZLZCUCQBXMTC
X-Message-ID-Hash: M6A2RDNI7DCPAH4ZRUT3ZLZCUCQBXMTC
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M6A2RDNI7DCPAH4ZRUT3ZLZCUCQBXMTC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 02:22:05PM -0700, Jackson Chui wrote:
> On Thu, Apr 04, 2024 at 05:05:09PM -0500, Alex Elder wrote:
> > On 4/3/24 7:16 PM, Jackson Chui wrote:
> > > Reported by checkpatch:
> > > 
> > > CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> > > precedence issues
> > 
> > I agree with your argument about the way the macro should be
> > defined.  But perhaps these gcam_*() functions could just
> > be eliminated?
> > 
> > I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
> > to gcam_info().  It would be a different patch, but maybe
> > you could do that instead?
> > 
> > 					-Alex
> > 
> > 
> > > 
> > > Disambiguates '&' (address-of) operator and '->' operator precedence,
> > > accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> > > 'struct device*', which is required by the dev_{dbg,info,err} driver
> > > model diagnostic macros. Issue found by checkpatch.
> > > 
> > > Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> > > ---
> > >   drivers/staging/greybus/camera.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> > > index a8173aa3a995..d82a2d2abdca 100644
> > > --- a/drivers/staging/greybus/camera.c
> > > +++ b/drivers/staging/greybus/camera.c
> > > @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
> > >   #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
> > > -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> > > -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> > > -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> > > +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> > > +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> > > +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
> > >   static int gb_camera_operation_sync_flags(struct gb_connection *connection,
> > >   					  int type, unsigned int flags,
> >
> 
> Thanks for the feedback, Alex!
> 
> I thought about refactoring it, but I feel it is worth keeping
> the macro around. It acts as an apdater between callers, who 
> have 'gcam' and want to log and what the dynamic debug macros 
> expect. Without it, the code gets pretty ugly.

Another idea would be to create a function:

struct device *gcam_dev(struct gb_camera *gcam)
{
	return &gcam->bundle->dev;
}

	dev_dbg(gcam_dev(gcam), "received metadata ...

(I don't know how to actually compile this code so I haven't tried it).

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
