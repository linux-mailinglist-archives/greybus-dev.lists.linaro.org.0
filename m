Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB986FA0F
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 07:29:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A57A743D35
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 06:29:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	by lists.linaro.org (Postfix) with ESMTPS id C747A3F3BF
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 06:29:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=PPEswc4u;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.48 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412e1b52934so3586085e9.1
        for <greybus-dev@lists.linaro.org>; Sun, 03 Mar 2024 22:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709533791; x=1710138591; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Sr+3/igGAuTwcw+O5i8ci7ivmixVyDSgfl+R16S+q0=;
        b=PPEswc4uOB4gl6Hxb08yfGGkaM3IAnWCHvFlvCy6hxJhFvHxAGRQ6P+n4jXOTtpy7B
         vdbIdXaM3WhU2oPmGtVUArdcsgtzVx6XWfFnPRV2Lzll/E15DSVYUke4/53VtcJuQfIk
         8di2/BQu97ATMbnDQ5mF/pQRps/UzVaa3DccppfOQXKRZjgGP+R5c/0FwjniWIhbIetI
         Ggb14W+IQoTwevyqQXrg70ATyF8T5s873V9Oc1O5KVF0qHuMUeKUlhg44YIyKLeTXyDt
         MtpdbLotUlyhZ5fWOT3MrztR4HrrU7GbU+sNy//nCc3sIkDXW0MWaM7oNctZXnaJJZ2U
         louw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533791; x=1710138591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Sr+3/igGAuTwcw+O5i8ci7ivmixVyDSgfl+R16S+q0=;
        b=jAXTJSNWaJlPaLeoj1e7z5p7NluNKYJ5oEuVrCD7N/ac19B0L+qyarbDCGlbqQiiAK
         EOZRG/VIJbDqWQBiURL1fCUiowxzByZCE4YE26Nzk5IW1GtA6fsSiEtMCHQxAw0b+sCn
         ecnRZ0W6cV17v4TdaaSPQfT3oP71Qi2OYyG0IOpb0ScLhatNhaOPaP1Qtn78NLY5u2pD
         2CBSzAFM5LF+q6l/H/tkAYbGFQArzBeeChHqY0hJHHorguxPrNCmfm3Fnv0tp3Xn/RK7
         lhSFHTprQUKmZsN7WVtknXYz5EmnQ22QQN5qszIgjkNxhD82bUeKZs5SFT4+OLg+6gvf
         VI/A==
X-Forwarded-Encrypted: i=1; AJvYcCUjr+nOXFHCvxGZ5rX6zdcp8Bbr1+36orb4xbPZFGbVfqnKhxceiBb1WlJJX6Lhj0dzmK4aMDiX3Xi4cwgd5S//u/UXZvF3gDUbX4E5
X-Gm-Message-State: AOJu0YxatNwiClYdQWkpTT6vVZXe6zu25Oz18hE26d7/KD64F0fVd4B/
	aAwOpFVOtQd0DAaE9xt82nGOgfeST3S4giKV4LftC5lA4Qy9kiSgMKhnQpDAyZxj1g==
X-Google-Smtp-Source: AGHT+IHq9JCYT783Wtc+zj9tHovEmxaZxWX3kn+l7xtGlx5U/KJDz3VB67RRX9FFH9wGGkZte3BftA==
X-Received: by 2002:a05:600c:4f82:b0:412:dab5:b20e with SMTP id n2-20020a05600c4f8200b00412dab5b20emr3940436wmq.8.1709533791619;
        Sun, 03 Mar 2024 22:29:51 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l21-20020a05600c4f1500b004101543e843sm16723413wmq.10.2024.03.03.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:29:51 -0800 (PST)
Date: Mon, 4 Mar 2024 09:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <02f31119-e35a-4358-a0a0-079416ba4a9d@moroto.mountain>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
 <m3ttlolktk.fsf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3ttlolktk.fsf@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C747A3F3BF
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.48:from];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
Message-ID-Hash: 4EJOBU35INR6GLFYIY5BKMU3IMMF5SGV
X-Message-ID-Hash: 4EJOBU35INR6GLFYIY5BKMU3IMMF5SGV
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Mikhail Lobanov <m.lobanov@rosalinux.ru>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4EJOBU35INR6GLFYIY5BKMU3IMMF5SGV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 02, 2024 at 03:23:03PM +0000, Rui Miguel Silva wrote:
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> Hi Dan,
> 
> > On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
> >> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> >> Assigning the channel the result of executing the get_channel_from_mode function
> >> without checking for NULL may result in an error.
> >
> > get_channel_from_mode() can only return NULL when light->channels_count
> > is zero.
> >
> > Although get_channel_from_mode() seems buggy to me.  If it can't
> > find the correct mode, it just returns the last channel.  So potentially
> > it should be made to return NULL.
> 
> Correct, thanks for the fix. Will you or me send a proper patch for
> this? Taking also the suggestion from Alex.

I'll send it.  Thanks!

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
