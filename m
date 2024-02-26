Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32386CAD5
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 14:59:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8404544244
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Feb 2024 13:59:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lists.linaro.org (Postfix) with ESMTPS id 3C4AF43C8B
	for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 20:20:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=marliere.net header.s=2024 header.b=pEmQVxxq;
	spf=pass (lists.linaro.org: domain of rbmarliere@gmail.com designates 209.85.210.170 as permitted sender) smtp.mailfrom=rbmarliere@gmail.com;
	dmarc=pass (policy=reject) header.from=marliere.net
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e47a104c2eso1985151b3a.2
        for <greybus-dev@lists.linaro.org>; Mon, 26 Feb 2024 12:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708978847; x=1709583647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ShDnaavgO9jOj5Fc4lvKVUeYKF5ykoCWTmxeShV2cgI=;
        b=vijKG/cC6urIyjJHwWE0vKTWPNj5YvTWWiY81vun82yPov+anB6iLlItMPnhmBX97h
         5hVsGJlb9o+NOGF8TBaSisOo1+jlFJSE8DoWXmvUNh/P+X0AOqRyxIVQHqIT+pgLYANj
         4jK4NiRCqSD3+nK7QFAIhZtqhvXVGPOFS4cbQXc3wxbqwRs3nE3FPSdPuXvOUezac9ty
         p4z8XMSjYZAA2cAndOYq+F2g4jmPi4w1jtWiHFvbQxhCDm06IR/nih4+pXTUQrJABvvV
         ouB4tpWpeKGSVnCh4PzsJO4qjR6VW7WpB81G/vHZ1DoJb9/xuZ1BIj9+9Q8VfEYmAmjX
         fRNA==
X-Forwarded-Encrypted: i=1; AJvYcCW/qEnp2hI5nMsH9iU+5ve0eVfnXkmUwvCgolEe5PXxjqtV7ZOrbk31yhqhwdLY7BRdcVKgHw3CMXx1uXZMLqn0SkD57a8Z6Xsh+O75
X-Gm-Message-State: AOJu0Yx7Ud5+jPYB/HY6yqYtjrEJtwuh6pOoat8y1AwHrc0zCYnXBG92
	RcOjtZHFWpaRQ6P/wBI+l3rKDHQ8GW65YrlWgqy1zlLbjrhIAU5w
X-Google-Smtp-Source: AGHT+IGkVTMzlozrOa/n8pAWspnUX1oUfLFxCwS4KJ2FptoKapNPY3SX+2TkHDBqaEqDzyYuAzu8tQ==
X-Received: by 2002:a05:6a21:191:b0:1a0:c950:9eb6 with SMTP id le17-20020a056a21019100b001a0c9509eb6mr184560pzb.27.1708978847231;
        Mon, 26 Feb 2024 12:20:47 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709026b4600b001dcada71593sm82108plt.273.2024.02.26.12.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 12:20:46 -0800 (PST)
Date: Mon, 26 Feb 2024 17:21:37 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708978845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ShDnaavgO9jOj5Fc4lvKVUeYKF5ykoCWTmxeShV2cgI=;
	b=pEmQVxxqoJhX4v8Z5ezIIwsj1cU+kk368ieeHNnvwJ4n5TKP5EKzSJvf+RIHhZNrsZpwoQ
	GKHHeV3iZsOo2Ygd1mIQM4lBD3jNcLtTeMDEl8YO+0pndRENcGxM2CnLqRzdJUDmNWb2KR
	fA8yz3dd2agtR+fDoLJf33Iho/aBJDaz2cnrlyN60ugDM0RKwIPdg7+9rutmIoP12nVoh8
	d56++uTZiTShRKU8M4aXuJSSzwqevlt8zD0IOrg5vV20wwE9vE+xvz+f/VlPHzaqeoS4gr
	oZXCwsl6EmtZ11kVOi50gkcPy/HmneK6zIkTznMZ+GKKQFvupmm4fMJbOcqbCw==
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Alex Elder <elder@ieee.org>
Message-ID: <xsotlft7byeu4iyyzty74dgzxtszmvyj4nuhga7qwuqc2tnubc@lp4ut22lc622>
References: <20240219-device_cleanup-greybus-v1-1-babb3f65e8cc@marliere.net>
 <cf5b2696-d7ca-40fc-856a-52f352cd270c@ieee.org>
 <ids3525jm5zkwkgizt2xtg3do37kqqtfdy5gc2cptdduexoe7r@cr4yxh3tykkh>
 <2024022553-deepness-sublevel-73de@gregkh>
 <yru2ywkyqwhg3rpyuqkkx73fxkkgsfj3vcbttnzrjq662ctrov@boh65bhxjjgo>
 <17e89261-d46b-4845-9fca-05dac3006a39@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17e89261-d46b-4845-9fca-05dac3006a39@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3C4AF43C8B
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.30 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[marliere.net,reject];
	FORGED_SENDER(0.30)[ricardo@marliere.net,rbmarliere@gmail.com];
	R_DKIM_ALLOW(-0.20)[marliere.net:s=2024];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.170:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[marliere.net:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[ricardo@marliere.net,rbmarliere@gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[209.85.210.170:from,24.199.118.162:received];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YUZQ4AHNKBD3XBHUZXXRUAN3KU5IRK65
X-Message-ID-Hash: YUZQ4AHNKBD3XBHUZXXRUAN3KU5IRK65
X-Mailman-Approved-At: Thu, 29 Feb 2024 13:59:21 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: constify the struct device_type usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YUZQ4AHNKBD3XBHUZXXRUAN3KU5IRK65/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26 Feb 13:50, Alex Elder wrote:
> On 2/25/24 5:04 AM, Ricardo B. Marliere wrote:
> >>>> On another subject:
> >>>>
> >>>> Johan might disagree, but I think it would be nice to make
> >>>> the definitions of the Greybus device types as static (private)
> >>>> and make the is_gb_host_device() etc. functions real functions
> >>>> rather than static inlines in <linux/greybus.h>.
> >>>>
> >>>> It turns out that all of the is_gb_*() functions are called only
> >>>> from drivers/greybus/core.c; they could all be moved there rather
> >>>> than advertising them in <linux/greybus.h>.
> >>> I guess it depends whether they would be used somewhere else in the
> >>> future. Perhaps it was left there with that intention when it was first
> >>> being developed? I agree, though. Will happily send a patch with this if
> >>> desired.
> >> Let's clean the code up for what we have today.  If it's needed in the
> >> future, we can move the structures then.
> > Sounds good to me, will send a v2 then!
> 
> I might be misinterpreting Greg's response; I *think* he
> agrees with my suggestion.

That's what I thought too.

> 
> In any case, please do *not* send v2 with the purpose of
> including my suggestion.
> 
> If you send a v2, keep it focused on this original patch.
> You can then implement the other suggestion as a follow-on
> patch (or series).

Indeed, this one is good as is but I thought of converting it into a
series so that they can be taken with no dependency on this one. So it
would look like:

Patch 1: move "is_gb_*()" into drivers/greybus/core.c
Patch 2: move "device_type greybus_*" into drivers/greybus/core.c
Patch 3: make "device_type greybus_*" const

But you're right. I could simply send 1 and 2 after this one has been
applied. If I were to send them separately, how would I communicate that
there's a dependency? Something like:

---
This series depends on [1].
[1]: lore://link-to-this-patch 

?

Thanks and sorry for the noobishness

> 
> 					-Alex
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
