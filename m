Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CE554076
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jun 2022 04:19:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6FD4B3F30E
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jun 2022 02:19:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	by lists.linaro.org (Postfix) with ESMTPS id 5552D3EA52
	for <greybus-dev@lists.linaro.org>; Wed, 22 Jun 2022 02:19:55 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso15345205pja.2
        for <greybus-dev@lists.linaro.org>; Tue, 21 Jun 2022 19:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i45DVLAIIMqvEaWYSwpuIS0opgqSETmmCquiuddLo3M=;
        b=Yu8c3qPoGd9CjhIdUnKjJvIoMxC2nNX/Mru2clcLp3/ITzfLfUlRn3Iu2L4fNAKV70
         1CFdLWSOT9pT6VYzb4RUMdVOSVdL1dXMMHL+14FEERrz/24ZA8sVzZIdB5SHvJxWXVbA
         i1askW7E3vUWrxly6vPW0Yj2PVEeS0lfFAi1g4d75YEnNntWqYiJhEEBCId9oTRG2Xsb
         Rxp2zL82cB85i5js+0n34BoZgcbJ7RZbbPlCFE8oK3/R4cCkY3ZVlujQADO0W5LrsbZe
         y8O0lc4nTlzNzt4K+hZWUcSD5n0ruebDCxZOB8Oyc0UXbZArBIWOp6+fOOBORUeXQPxb
         +YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i45DVLAIIMqvEaWYSwpuIS0opgqSETmmCquiuddLo3M=;
        b=o7M3kph7hGjX667xy7X34PQaut81ZrEjnFCSRQldFglc/rfX58lkwWcXkRpyCj0lOr
         yYad5yUEbYf74A76sGvaTNBAjyIg7BOTVo3hJ6NQbY67Bm0BrKotb154nZ1zPMhQcYUn
         WGygD+fDzl+TdxVwwtympUYd2H4q/Rw5Nl2q6710mzzV+WYGSBquMG9AdWxRnLZqPHjx
         hOH1vXUGJLK0FV141B+KV9Weo/BAd42pMBnjX2LQfpPvcW8bnbvgZb/KGISsTnmWacSJ
         ZtDrYVzfBesCzGn/u4aWDw3zH5jcRBneuT2m6TaDtdjYAoxQrp1t4BNLnCupMnpp1crp
         sceg==
X-Gm-Message-State: AJIora/criy4PpE7+y+akAVCL37o508cezxeEcxNE2EEhnJLWMIOpEGl
	y4M1HjXiUoLJXNG0QQ93UHgurYYa
X-Google-Smtp-Source: AGRyM1uyDHTiR9BRAHTk5PB8yY3a141K8XcjfoLDdtVyLPfIuAK30qHwHmtDuh9+hMyXQGj04hVhZg==
X-Received: by 2002:a17:90b:3802:b0:1e3:3f3a:3621 with SMTP id mq2-20020a17090b380200b001e33f3a3621mr47404875pjb.65.1655864394421;
        Tue, 21 Jun 2022 19:19:54 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902c2d200b0015e8d4eb1dfsm11350332pla.41.2022.06.21.19.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 19:19:53 -0700 (PDT)
Date: Wed, 22 Jun 2022 07:49:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20220622021951.gni6cnvriogg6onj@vireshk-i7>
References: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
 <YrHYZb2BT8fQMcaR@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YrHYZb2BT8fQMcaR@hovoldconsulting.com>
Message-ID-Hash: GCNOZEWUZNSNM32ZV4I4FUK57MMAURPJ
X-Message-ID-Hash: GCNOZEWUZNSNM32ZV4I4FUK57MMAURPJ
X-MailFrom: viresh.kumar@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Dongliang Mu <mudongliangabcd@gmail.com>, vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: Unitialized Variable and Null Pointer Dereference bug in gb_bootrom_get_firmware
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GCNOZEWUZNSNM32ZV4I4FUK57MMAURPJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21-06-22, 16:40, Johan Hovold wrote:
> On Tue, Jun 21, 2022 at 10:36:04PM +0800, Dongliang Mu wrote:
> > Hi maintainers,
> > 
> > I would like to send one bug report.
> > 
> > In gb_bootrom_get_firmware, if the first branch is satisfied, it will
> > go to queue_work, leading to the dereference of uninitialized const
> > variable "fw". If the second branch is satisfied, it will go to unlock
> > with fw as NULL pointer, leading to a NULL Pointer Dereference.
> 
> This sounds like the false positive that checkers keep tripping over.
> 
> Please double check your analysis and search the archives first.

And everytime I get this report, I wonder if I should change the code to be a
bit simpler :)

-- 
viresh
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
