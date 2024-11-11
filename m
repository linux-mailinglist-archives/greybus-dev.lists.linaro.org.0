Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3EC9C3AA2
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Nov 2024 10:14:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B9FFC43F65
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Nov 2024 09:14:30 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	by lists.linaro.org (Postfix) with ESMTPS id 76176411D3
	for <greybus-dev@lists.linaro.org>; Mon, 11 Nov 2024 09:14:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="mrwyVB/H";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.218.43 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso724888366b.3
        for <greybus-dev@lists.linaro.org>; Mon, 11 Nov 2024 01:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731316465; x=1731921265; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NWeH3jkHDc0Ye+Ypt1Wuxtz4WCpROEp8hmtW2LYWTE=;
        b=mrwyVB/HscUJr3Os3qrOem3U0eJaSQKa4Fw+sUs9o2yYcH3el6zllrvwdXc8RtD0mH
         GRJ5U0EDhNp4bmDoYNxMbHUoOLhMxSZtQvZMdSMmSBmIfsWGdsC1M/XMuv6Nc2qAaEYT
         uAEd1ziL1YCLppe1Se+wHRUqgfkYrayVWIxIW9G2XYSopR9cb9z70yS8LiZhWsRxVMN3
         hzBJs2xEnyw45PHW++8CZLu8jvmpAcOR3rs6J7yZbhQOanoAscaJ0EhjfnkxrvJhx7+e
         HiSr69ScqyUx5/y1fEXkNoVX2SnR2Ikdb2k8+2Go0JgYSEepCnQhTMf1ppiUWVz43QBr
         P+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316465; x=1731921265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NWeH3jkHDc0Ye+Ypt1Wuxtz4WCpROEp8hmtW2LYWTE=;
        b=eQ9FgJf05/jKJaBCkEbpv0V7UUC2CYRvkNWpPYdiyhlevU67RTnkL8TuKo2psV8Fmc
         SSQuhlZYA1Lew7Z/GXkhBC0xlKMXdHyOTwNg6/tD2aKt77tM1f16eEsrfTmoZxjxDsm3
         68rjdGtSeKCyg5IlFPpXFCQ8PPXQetCXik4Suvmu7Awkkm+JmTJUzcM4wzOC/RRHdXyx
         eRpXhAASOdSoAoeT8wx+X2kKUJ09l4Hw92OWwgT5NhBG59PkSYPdGTYXPGgG5RHxzdGD
         sPPRaKzDjDYBZFF84Rl+1TcWL6qAQEsUd7s4db5OLhdjpkjL4FNqMr+MlsD2/bwv5P+t
         ioSw==
X-Forwarded-Encrypted: i=1; AJvYcCVED0Tfe5azcU4uJPZcaA7CpQf9pMCZvBoVMbQHMu6u0/dEf4J97QzJ3TnoXYe1qNAKY7I9QXjC6RzTbA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx/24R4CnCC9JEhD4mzMAL9SpFbWgnL3/Ekw7GufHekkc/RaSTU
	EjHjJpRoV+GSEtxMFQsYIR5NweSkE6lmZeu6UUl2u4pnvKWwgduuZE8NC6pSb4q5qw==
X-Google-Smtp-Source: AGHT+IEJR5XILRv2WOEUbzmDldjOYjUKGr4w+bCfjgRlb0NalsMvd9Y6kH0/jAioZL9hxiS+S8Zk3w==
X-Received: by 2002:a17:906:c103:b0:a9a:4158:494a with SMTP id a640c23a62f3a-a9eeffeedd4mr1144156866b.41.1731316465395;
        Mon, 11 Nov 2024 01:14:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4b82csm579790466b.67.2024.11.11.01.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:14:25 -0800 (PST)
Date: Mon, 11 Nov 2024 12:14:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Message-ID: <9378fe55-66d5-4a11-9524-a0ed01f458ed@stanley.mountain>
References: <20241107113337.402042-1-chenqiuji666@gmail.com>
 <2024110724-overbuilt-liquid-3734@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024110724-overbuilt-liquid-3734@gregkh>
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_7(0.50)[209.85.218.43:from];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	RCPT_COUNT_TWELVE(0.00)[12];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.218.43:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 76176411D3
X-Spamd-Bar: --
Message-ID-Hash: BFKZZGOZZQF3NL3JZTZVAGCQ2TW2HB7V
X-Message-ID-Hash: BFKZZGOZZQF3NL3JZTZVAGCQ2TW2HB7V
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Qiu-ji Chen <chenqiuji666@gmail.com>, dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, linux-media@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BFKZZGOZZQF3NL3JZTZVAGCQ2TW2HB7V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 07, 2024 at 04:11:00PM +0100, Greg KH wrote:
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> 
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.

Like Johan said, this doesn't really belong in stable because it doesn't affect
users.  It's mostly about correctness and static analysis.

The linux-media CI system has also started complaining if we don't add a stable
tag and it suggests that the correct thing is to add:

Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

Do we really have to do that?  Applying it to stable doesn't cause a problem,
it's just not necessary.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
