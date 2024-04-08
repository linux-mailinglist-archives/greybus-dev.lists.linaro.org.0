Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8544789B7AB
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 08:35:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5268343FEA
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 06:35:28 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	by lists.linaro.org (Postfix) with ESMTPS id 2CAD33F003
	for <greybus-dev@lists.linaro.org>; Mon,  8 Apr 2024 06:35:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=tnWWKpSQ;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.50 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51a7dc45easo314797766b.2
        for <greybus-dev@lists.linaro.org>; Sun, 07 Apr 2024 23:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712558124; x=1713162924; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgLtq4Q2TlcP1vQLZpHaRdv1skB8tG59UvbmyPM0V6M=;
        b=tnWWKpSQR1ueH4FwDmMc8QtJJvP5uyk1Y5Q5yODod27LZ5+94DksSR2bhEiea1q8jC
         O6EpNluPKYNp7xqbePUzvgs6uy660bLFShnmctfNOIkihcWi1lwF1Gpi0o+ZDnIVxkOi
         Abt51BlZ6oCR3i20+vHTK/jvMjEW9IfkvblaeFC/PIlRu3sjNXbPrmeKHH1lvSPW+0Sh
         lpLkz8sUYCNDAdi+DicLLiqTTrrPscSBwp+Qe7PKvVXGNLcCgPSxxmESFy6sOzSclIBx
         klrn1Gxupd0wxduorTIv2BH5hKUWNW5DaDSnIREAnBbe1ULcuQtFd61eJJnPINJ2wjEW
         ZriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558124; x=1713162924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgLtq4Q2TlcP1vQLZpHaRdv1skB8tG59UvbmyPM0V6M=;
        b=Wdx/VZhf80OhwfqTKYpQuJ7hbuI0fa9rkYZeFcCQOaT7CrI5COh6RSAVeggMpGS4NT
         XRohq5L6m6ei/U3vnqJde7RQKpa3wVDnEYmwwjGExwICCBIaZIVOZHlpfxmns/mAF9EY
         4YHB4Y/KIbtmnBq0mg/BQUmuaRJHEHySO4n+wFvHA85BUesRTmqWX8Or+5x+XcAibK0y
         AFyx8InnwPpncaWStlRI7JG/Xnpu8soU184i+ooTcx9pdo+O0aCeUP09A+7AREaa5cOr
         +ZTytzV1wSSlrkAk8IKR232CMm3xKkUuis+rziooC6Fj7t8fhrnfEWW2fBxVbQOPZWNd
         E3kg==
X-Forwarded-Encrypted: i=1; AJvYcCXMDrGTGkuvPO+SB/vrNo13XErJcxVuYVmxOy1b/kUQp3w9Cr2vPSDLRZOokxq+W4e8gDvGzTYtg/n8vUWMYPwlv9ukvPIBdoaGLndV
X-Gm-Message-State: AOJu0YzdLy4s5NXucFiaOLU33b00rP09t07GkOPbBjhJkbA3TN6HUdy1
	8IIOQA1JYWNEx3EWkoe0hAdXQGmd4NNl+rMevbfl0lfvqn9GljrrUSLYsrmSvQ7JSw==
X-Google-Smtp-Source: AGHT+IF4EKTTmquAMoLVkOL3W63bmhNdWh38zIYl5ZaMdc7DqN4H52hPc5f4R3mNWxMKNOJbOZxeIw==
X-Received: by 2002:a17:906:3752:b0:a4e:23a1:9ede with SMTP id e18-20020a170906375200b00a4e23a19edemr5078782ejc.36.1712558123980;
        Sun, 07 Apr 2024 23:35:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906a29500b00a51a2711177sm4054925ejz.13.2024.04.07.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 23:35:23 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:35:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
Message-ID: <e037e303-47b3-4758-914c-980ebe88d450@moroto.mountain>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
 <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
 <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>
 <ZhHOKkqVIdsuZ-4Q@mba15m2.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhHOKkqVIdsuZ-4Q@mba15m2.local>
X-Rspamd-Queue-Id: 2CAD33F003
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.50:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:dkim];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: WT5YUPKHZ3RIUFNKAZJSYL4D7AOQ6D7X
X-Message-ID-Hash: WT5YUPKHZ3RIUFNKAZJSYL4D7AOQ6D7X
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WT5YUPKHZ3RIUFNKAZJSYL4D7AOQ6D7X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 06, 2024 at 06:35:22PM -0400, Jackson Chui wrote:
> > 					-Alex
> 
> Dan, Alex I think both of you are spot on.
> 
> I like the suggestion of adding 'gcam_dev()' as an accessor
> function and directly calling to 'dev_*'. I'm busy this weekend
> but will send out a new patch with this change next week.

Nah, don't bother with adding the gcam_dev() function.  Like Alex says,
it's only 4 characters shorter.  Just get rid of the macros and do:

                dev_err(&gcam->bundle->dev,
                        "Unsupported unsolicited event: %u\n", op->type);

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
