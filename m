Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252586CAD6
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 14:59:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 80D5F4402F
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 13:59:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by lists.linaro.org (Postfix) with ESMTPS id 619D43F00F
	for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 20:59:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marliere.net header.s=2024 header.b=n5GKoXZ0;
	spf=pass (lists.linaro.org: domain of rbmarliere@gmail.com designates 209.85.216.43 as permitted sender) smtp.mailfrom=rbmarliere@gmail.com;
	dmarc=pass (policy=reject) header.from=marliere.net
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29acc73df4eso870059a91.1
        for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 12:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708981150; x=1709585950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tvXtQkou+3jgtWiymj8iA4CC02C8/+k3MEqbkxtLPKw=;
        b=gmpjjCuUv13pyglptYSfZTGuADBbgpUtOe8bfFjKuPRuYRQW1bvnqlfYFbWxSEEF07
         yadTV8LRQ1yxMsitfrQNyqWlVhqbL36OxyPla8dOeJZppGRdJoYjDvnGsCp4CPg52S5l
         MBcVO5m67LwL5m+7/UIp0B1xep/lF36WF1vjPOWyUasHBNFWIKZj2ke6b4kZJs9rw5a5
         wyK8AI0AVDGMRbrbRMl4IJA6gVi59ljbaARZPj5xKDRQ1Dp1I/CIDU18u2DIN8zAu/n6
         pv59Qad31NdGpCgIf2q7O4XzjYDgY5OsBVQW2xHxAF3b234OV5Ee2lbijx7DYQ0svTax
         EArw==
X-Forwarded-Encrypted: i=1; AJvYcCWCWrsUljpMBvkWSRmSS04CPttuPPCqq+cl3v4MfkSoxW1+DZOcur/wXCSeRiRndVrsi8YaqNcwlxDA2RFNytSRrh1V24Pnp/q/7kMq
X-Gm-Message-State: AOJu0YzG66OPt4an/fNIP0blXcxCNfyubthaXqjgwQQMwu2nT8kSwcSk
	qlEgazeaTrGa541Bwd8fl0vZq4O9EY/asECAHWSMzMQDcJJbPT0N
X-Google-Smtp-Source: AGHT+IEl9slEL2hYnORXfQhlJr0N8zi7zwtb/4MHBm69JdEjfna6RlEEcHsmlCwJts1srq5ul5ohVQ==
X-Received: by 2002:a17:90a:e681:b0:29a:d7ba:2c99 with SMTP id s1-20020a17090ae68100b0029ad7ba2c99mr1783387pjy.10.1708981150468;
        Mon, 26 Feb 2024 12:59:10 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id sh14-20020a17090b524e00b00298ca3a93f1sm7213170pjb.4.2024.02.26.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 12:59:10 -0800 (PST)
Date: Mon, 26 Feb 2024 18:00:03 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708981148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tvXtQkou+3jgtWiymj8iA4CC02C8/+k3MEqbkxtLPKw=;
	b=n5GKoXZ0G8qjH7PgyxYBabm8cJZNQK60cM2AA7trHXqbEngzJwg7iSCdAypXVFTBG185ok
	FlRMAJHHIoHLu/KCMriXJiEAtbagV0dbqJ4V1iaW/RWSLiYsmwv1X32nG7Rlb+bd3RG0rw
	zFMDZ1Q2GfcrBZQamF2iIqvQ+EJ4hQf9F2x110ddW266hXEvI4c4tK8HPt+2jgyQto6y5g
	ssrwcwuZHTeEE3Dd5MbaXZ5beN39uwibH/1juxNTuF0wu9QGLl+3PJvwXz+ZdaKaLNAEmP
	URigvlwP2IUjDidJWra99YrLFOp1ehWUTA6EUGT0Lj5S8J5FBsGLzuM9m/3YiQ==
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Alex Elder <elder@ieee.org>
Message-ID: <i2pptclnx3otryvzzndtfh5zqgmenbe2aa36xfrbpuripbfsym@5ophc6hj3u3g>
References: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
 <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
 <ids3525jm5zkwkgizt2xtg3do37kqqtfdy5gc2cptdduexoe7r@cr4yxh3tykkh>
 <2024022553-deepness-sublevel-73de@gregkh>
 <yru2ywkyqwhg3rpyuqkkx73fxkkgsfj3vcbttnzrjq662ctrov@boh65bhxjjgo>
 <17e89261-d46b-4845-9fca-05dac3006a39@ieee.org>
 <xsotlft7byeu4iyyzty74dgzxtszmvyj4nuhga7qwuqc2tnubc@lp4ut22lc622>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xsotlft7byeu4iyyzty74dgzxtszmvyj4nuhga7qwuqc2tnubc@lp4ut22lc622>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 619D43F00F
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[marliere.net,reject];
	FORGED_SENDER(0.30)[ricardo@marliere.net,rbmarliere@gmail.com];
	R_DKIM_ALLOW(-0.20)[marliere.net:s=2024];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.43:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.216.43:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ricardo@marliere.net,rbmarliere@gmail.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[marliere.net:+]
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZDXN2VZXR3HTFED6BD43KT4AB3IRAS4P
X-Message-ID-Hash: ZDXN2VZXR3HTFED6BD43KT4AB3IRAS4P
X-Mailman-Approved-At: Thu, 29 Feb 2024 13:59:21 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZDXN2VZXR3HTFED6BD43KT4AB3IRAS4P/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26 Feb 17:21, Ricardo B. Marliere wrote:
> On 26 Feb 13:50, Alex Elder wrote:
> > On 2/25/24 5:04 AM, Ricardo B. Marliere wrote:
> > >>>> On another subject:
> > >>>>
> > >>>> Johan might disagree, but I think it would be nice to make
> > >>>> the definitions of the Greybus device types as static (private)
> > >>>> and make the is_gb_host_device() etc. functions real functions
> > >>>> rather than static inlines in <linux/greybus.h>.
> > >>>>
> > >>>> It turns out that all of the is_gb_*() functions are called only
> > >>>> from drivers/greybus/core.c; they could all be moved there rather
> > >>>> than advertising them in <linux/greybus.h>.
> > >>> I guess it depends whether they would be used somewhere else in the
> > >>> future. Perhaps it was left there with that intention when it was first
> > >>> being developed? I agree, though. Will happily send a patch with this if
> > >>> desired.
> > >> Let's clean the code up for what we have today.  If it's needed in the
> > >> future, we can move the structures then.
> > > Sounds good to me, will send a v2 then!
> > 
> > I might be misinterpreting Greg's response; I *think* he
> > agrees with my suggestion.
> 
> That's what I thought too.
> 
> > 
> > In any case, please do *not* send v2 with the purpose of
> > including my suggestion.
> > 
> > If you send a v2, keep it focused on this original patch.
> > You can then implement the other suggestion as a follow-on
> > patch (or series).
> 
> Indeed, this one is good as is but I thought of converting it into a
> series so that they can be taken with no dependency on this one. So it
> would look like:
> 
> Patch 1: move "is_gb_*()" into drivers/greybus/core.c
> Patch 2: move "device_type greybus_*" into drivers/greybus/core.c

Sorry, this made no sense!

> Patch 3: make "device_type greybus_*" const
> 
> But you're right. I could simply send 1 and 2 after this one has been
> applied. If I were to send them separately, how would I communicate that
> there's a dependency? Something like:
> 
> ---
> This series depends on [1].
> [1]: lore://link-to-this-patch 
> 
> ?
> 
> Thanks and sorry for the noobishness
> 
> > 
> > 					-Alex
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
