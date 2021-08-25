Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D383F763B
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Aug 2021 15:45:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 044FE6116E
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Aug 2021 13:45:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AF1DD61F0E; Wed, 25 Aug 2021 13:45:22 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 72A1D60A0A;
	Wed, 25 Aug 2021 13:45:19 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B200D604A2
 for <greybus-dev@lists.linaro.org>; Wed, 25 Aug 2021 13:45:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A6231608D5; Wed, 25 Aug 2021 13:45:18 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by lists.linaro.org (Postfix) with ESMTPS id 9C4B6604A2
 for <greybus-dev@lists.linaro.org>; Wed, 25 Aug 2021 13:45:16 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id x5so24045450ill.3
 for <greybus-dev@lists.linaro.org>; Wed, 25 Aug 2021 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XVnwmb3uXk8+1b5/nov/HrYkqSqNgLeJ1iqRG3io5N0=;
 b=RQtGz41gdrHxJMSAR/9QsLqlxfSrX0hrSv7IbjruEEyWUYs0PDiNVtbcrdh86ZyG+k
 +u2CTpspyxSEDvNfXSzc+xiQsIO1akPDNkmpJD3ROH96aJbuyqkRhpqL584tmJEKke+b
 pywRAzsBSyWapg/6RA9iOO5t2CIuBxhbq7qCw2oj6TzE5jwk0RWNIT8b0PlI8/2niq3/
 x92u9l3DxfEchPc7CvO8+LNk7+TXcSEnFdD0ugkpgu7BdJHjSSi4R8Tpf/WsEphDzEwC
 O6Txj9pNNU9xUO9ChILv4MSeQQBo9C6H0fjgdcJMeh9MuDya6THtIVsKEI5qsuzmdS27
 2zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XVnwmb3uXk8+1b5/nov/HrYkqSqNgLeJ1iqRG3io5N0=;
 b=ueTGNQO3FeHRLC/UJDjqd+AClSv1czgj7babUK8OlYqDPQRw/p7hEIks2KXwHzg4eh
 pEInNeYm7RZ+wXppqUBt4AkjXEggBMEa9vrqJR6zDWkhWXI50AkMvGqhLwUtMbV/tMrs
 UfvopFhxxjELbcmkX+79UL/mAbCdxpJVz2+Fwdz3JwZ2K8qE91gXB5rEKY0Kj6k0REs6
 GKiCa2vMeBKb2dMeVXJh338znxBYjw0s81VGQQh7Y/6oiHEe5fCbxaFLkdHEc53nlQ0b
 psaoqEAd0c9tcub9SMOkDeEqY3+n6P1Q1XA9mxJqYRnwEw/qPQVQYohrL7vWLggAfG8A
 kcHA==
X-Gm-Message-State: AOAM532KIeQRJ0mDemAZ0zgfieFv0uiNip2toOGCB4e374/NSbX6Lvm2
 wRkTL1+A9eGID8GLuQSyNZa7u+Dg
X-Google-Smtp-Source: ABdhPJwNusjSb6QKB8DsRhuL2iL/qaGyFgeDyXoTeRFLXrUNExbto5enJ6RAGiTXnrs6B+7jby7tBw==
X-Received: by 2002:a05:6e02:13f0:: with SMTP id
 w16mr29929619ilj.268.1629899115683; 
 Wed, 25 Aug 2021 06:45:15 -0700 (PDT)
Received: from [10.10.10.120] (047-035-132-030.res.spectrum.com.
 [47.35.132.30])
 by smtp.googlemail.com with ESMTPSA id k2sm11685057ior.40.2021.08.25.06.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:45:15 -0700 (PDT)
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Elder <elder@ieee.org>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
 <1838037.Ul9q4Z07vA@localhost.localdomain>
From: Alex Elder <elder@linaro.org>
Message-ID: <335f30c7-8ab4-d46a-d415-e994997a3fa5@linaro.org>
Date: Wed, 25 Aug 2021 08:45:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1838037.Ul9q4Z07vA@localhost.localdomain>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from
 IDR to XArray
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 8/25/21 12:20 AM, Fabio M. De Francesco wrote:
> On Monday, August 16, 2021 4:46:08 PM CEST Alex Elder wrote:
>> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
>>> Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
>>> is more memory-efficient, parallelisable, and cache friendly. It takes
>>> advantage of RCU to perform lookups without locking. Furthermore, IDR is
>>> deprecated because XArray has a better (cleaner and more consistent) API.
>>
>> I haven't verified the use of the new API (yet) but I have a few
>> comments on your patch, below.
>>
>> 					-Alex
> 
> Dear Alex,
> 
> On August 16th I submitted the v3 of my patch ("staging: greybus: Convert uart.c 
> from IDR to XArray"), with changes based on the comments you provided.

Yes, I intend to review version 3.  I'm sorry I didn't respond to
your earlier message; I am on vacation this week.

					-Alex
> 
> Could you please take a few minutes to review this too? I would really appreciate it.
> 
> The v3 patch is at https://lore.kernel.org/lkml/20210816195000.736-1-fmdefrancesco@gmail.com/
> 
> Thanks,
> 
> Fabio
> 
> P.S.: I'd also like to know if you think it's worth converting IDA to XArray in order 
> to improve the Greybus driver in staging.
> 
>   
> 
> 
> _______________________________________________
> greybus-dev mailing list
> greybus-dev@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/greybus-dev
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
