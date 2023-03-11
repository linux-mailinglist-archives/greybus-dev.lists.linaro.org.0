Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC96BDC00
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 170293E8AA
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id 3A61A3EA3F
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:23:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=qzQizoZd;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.42 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso8039392wmb.0
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678544596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JC79/623i27Cxw2oHO9ZNA+BBrwFL63Y2y1N3InP394=;
        b=qzQizoZdoOAV8U0V1DKM5AXdgHedYktTRCqc8eC9LY8VLJ7hJLsoruAM0UiOQahmDd
         XzJUNT1h33ILhuAaLC1/gCgyj0ug74fR6JdU4uICnxvXs/BIwAlCSsOnMqXSpAZVPFQB
         gRhfgrAy5Brobv5P5ndTNL2zvMm0bOM336CF0k4kIVymF5hhSiGpaH7DvSLA3Z7AUWDv
         95MJZy9KOJUi24Olo88njU/+YREJD++FvAs2glMz2snGUkV77kPJQ3lruJGvbrP1mEzX
         CnN2nnZwr2EDAQ1nVDLeBKQIVUO0XtpryhpQ2Ra5exgRbm5KFC2ro5DeiuCtYExUlno7
         VS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC79/623i27Cxw2oHO9ZNA+BBrwFL63Y2y1N3InP394=;
        b=WSmlzqF9I7vABKJ4jXY5Mh4oTmvDEaCqrDw9BLMzapl2i22LRJV/MKWOqiALoZ8on4
         2zld+JFW/4scdtjhrQR8x5BgGRN1HCvOmYQYN1R/Yy6btynnCNAstVcPlvqJZCYFM2PG
         PUSrWcaXPcXsVdN7s+llLdJXdfkOFGqhSY1u2YTYlQF+uuvuj4gGD9WwykfqIaNy0Yv2
         3ThNYi5o07NBnRkiqt6lcWd0dXlT3cWyF5aXXOaPkThl786e1J/KRs4tRe8bvfHfRaPS
         Y5lkZPRyCEKG986Vg6wAXGigrjMogDxfQilNup8cbrUE+nnTKan4bFsHm1OiRDOH1nox
         lezQ==
X-Gm-Message-State: AO0yUKXuS6xLmlb4U4xMsuGZctw7UUO+zXMBlm951H9An3yz7JzTWjpt
	XfmX3aTe0Eu0/7ReZ5PKqxI=
X-Google-Smtp-Source: AK7set+0hL7GplngJh2S5guRgk81WnVs+2avq3FwRMHVkBPis5fUt0y6gsw5oWe7JFtN55dR6XDQCw==
X-Received: by 2002:a05:600c:314d:b0:3eb:3945:d3fd with SMTP id h13-20020a05600c314d00b003eb3945d3fdmr5912869wmo.14.1678544596078;
        Sat, 11 Mar 2023 06:23:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcdef000000b003e00c453447sm2988242wmj.48.2023.03.11.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:23:15 -0800 (PST)
Date: Sat, 11 Mar 2023 17:23:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Message-ID: <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3A61A3EA3F
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-2.99)[99.96%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_NONE(0.00)[gmail.com:dkim];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.42:from];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7GHBOGYMYVPPTHM7DDYXMOJMRMF646SE
X-Message-ID-Hash: 7GHBOGYMYVPPTHM7DDYXMOJMRMF646SE
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:29 +0000
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7GHBOGYMYVPPTHM7DDYXMOJMRMF646SE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 04:06:51PM +0200, Menna Mahmoud wrote:
> according to Alex feedback
> 
> " I think this type of alignment is not a major problem,
> and alignment isn't done this way in general in this
> driver, it's probably OK to keep it that way. - Alex "
> 
> 
> ,I won't resubmit these patches, right?

Yeah.  Find something else to fix.

I feel like in outreachy and similar that people send a first patch and
then they get a bunch of different feedback.  And it's like checkpatch
is complaining and it's staging code so probably the code is actually
ugly in a way.  But often it's better to abandon the project instead of
getting obsessed with it.  Zoom out a bit.  Find something else where
it's obvious how to improve the code from a readability perspective.

People are giving you feedback to help you and not because they are
about that particular line of code.  They won't care if you work on
something else instead.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
