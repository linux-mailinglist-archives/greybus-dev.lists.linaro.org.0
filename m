Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785D6C96B0
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DBF5643CD1
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by lists.linaro.org (Postfix) with ESMTPS id BA1F33E8AB
	for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 16:19:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=oWIQTF8G;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.214.170 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id k2so2253042pll.8
        for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679674780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GcRU+3Df6sch2ymL5NXBQO6zVQfdEa74o4nvNV6luxg=;
        b=oWIQTF8GO82CugYWAgdiV5RGkyHBdeDUHQPbumdrXpTQseSP5VEySKvMejl9vEkVMw
         1B1IvRchFgMX0BRIVDcGH42fje5WbeHrIP/HzHJrjis4aJNsY5Mmj8yDsIoSBWg5z1Dg
         gGo8/50iB6yCBUbfDxr/KrCyXF4cixKGgVmyRvgQNLC85wm6xY/7uvrjooXlOSlnJOtB
         DcqVV3JHhwzIv9S94GdSqBmc9erf26+BNXT0Umm4ABFxErBf87sefAKiAVCD48gusIyJ
         TWxAFK/wSjD9deki8fwipuNsCs4X9QOEaS851ie/a0kjc0bqVGFdmH42g80FIvAPsKU8
         b97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679674780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcRU+3Df6sch2ymL5NXBQO6zVQfdEa74o4nvNV6luxg=;
        b=aRAjItfbtptXKAiPvUDZ+xj+Vy1CUuFOC7oPUNZfjtZuUO76QiiIX9ajGoBlu6lZ+8
         Q8UzDEiSVwnnmRQm1m+KHC4jtAbRrhyXvNuwdT77jE/75voqzKP37Qj4siZGTLlDNKXS
         yESXXiANZQTFFHH2F/gCAITmIatIDKXK2jctlo+FhRKSWymwa0eca7MqvrA/7bW7s/1N
         l2dLNDTlZStI0aZ5WPlvqdYjfNnvW6N46m/WkWAtWno2iJGEsWJChM44iB2rpkaMCYm1
         dS1PTmwryJ2AGP6NhaCJJFl4SBRTlEAMz3Ufbp/Z0TuXOtWwxx1x+Mnln03FjW0UUm37
         IV9w==
X-Gm-Message-State: AAQBX9eVM4mjHy02AOCTV52uyX8tfkt5TDcq5rEJaIY76nmI3wAh7rFu
	rE8zbwI/jaoLzeNXCafBnE0=
X-Google-Smtp-Source: AKy350aTgNwwO8z9vDGdaqdwVaR+5mjRd0oD8yxP/+5RxB+F62sTIoQDmv+8HMLru970L0B6ZLgFww==
X-Received: by 2002:a17:902:6944:b0:1a0:4ebd:15da with SMTP id k4-20020a170902694400b001a04ebd15damr2492184plt.66.1679674779655;
        Fri, 24 Mar 2023 09:19:39 -0700 (PDT)
Received: from sumitra.com ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id z8-20020a170903018800b001a19f3a661esm14341040plg.138.2023.03.24.09.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 09:19:39 -0700 (PDT)
Date: Fri, 24 Mar 2023 09:19:33 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Message-ID: <20230324161933.GA174474@sumitra.com>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
 <ZB3BshO6Yen25LvB@aschofie-mobl2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZB3BshO6Yen25LvB@aschofie-mobl2>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BA1F33E8AB
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.170:from];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GWZ23KSU5RIJZDDGCSZUPYKAHU2RHJBR
X-Message-ID-Hash: GWZ23KSU5RIJZDDGCSZUPYKAHU2RHJBR
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:33 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 0/3] Staging: greybus: Use inline functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GWZ23KSU5RIJZDDGCSZUPYKAHU2RHJBR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 24, 2023 at 08:28:50AM -0700, Alison Schofield wrote:
> On Fri, Mar 24, 2023 at 12:20:30AM -0700, Sumitra Sharma wrote:
> > Convert macros to a static inline function, to make the relevant 
> > types apparent in the definition and to benefit from the type 
> > checking performed by the compiler at call sites.
> > 
> > CHanges in v2: Change patch subjects, noted by Alison Schofield 
> 
> 
> Please review: https://kernelnewbies.org/Outreachyfirstpatch
> Section on 'Following the driver commit style'.
> 
> To follow the commit style of the greybus driver, update these
> commit messages to be under 80 chars, and use "staging", not
> "Staging"
> 
> Like this:
> drivers/staging/greybus$ git log --oneline | head -3
> 1498054921e2 staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
> a7d2a41b7453 staging: greybus: Inline gb_audio_manager_module()
> f7d3ece211be staging: greybus: Inline macro gpio_chip_to_gb_gpio_controller()
> 
> BTW - I wasn't instantly sure about using 'Inline' as a verb in this
> case, so I did this (git log --oneline | grep inline) and found it's
> a common use. 
> 
> We're building a habit here for when you submit across subsystems
> in the future. 
>

Hi Alison,

Thank you for helping me out with this patch subject.

PS: I am focusing on writing good patch subjects and descriptions.

Regards,
Sumitra

> Alison
> 
> > 
> > Sumitra Sharma (3):
> >   Staging: greybus: Use inline function for macro
> >     gpio_chip_to_gb_gpio_controller
> >   Staging: greybus: Use inline function for gb_audio_manager_module
> >   Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip
> > 
> >  drivers/staging/greybus/audio_manager_module.c | 7 +++++--
> >  drivers/staging/greybus/gpio.c                 | 7 +++++--
> >  drivers/staging/greybus/pwm.c                  | 6 ++++--
> >  3 files changed, 14 insertions(+), 6 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 
> > 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
