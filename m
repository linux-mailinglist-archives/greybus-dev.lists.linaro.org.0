Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 595273ED98A
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 17:10:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF5E460C2C
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 15:10:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8990E60A52; Mon, 16 Aug 2021 15:10:13 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 608AB608D5;
	Mon, 16 Aug 2021 15:10:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2F06360804
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 15:10:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 22DDC60865; Mon, 16 Aug 2021 15:10:08 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by lists.linaro.org (Postfix) with ESMTPS id 1901760804
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 15:10:06 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id f11so23340902ioj.3
 for <greybus-dev@lists.linaro.org>; Mon, 16 Aug 2021 08:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ApokTc8mxObi8oLsmYtRa9frQO6t6d0mzitkU5awMsA=;
 b=Ktq396n8+YfDiWEgaDGrc2kjUj/FbqM187aiv6pP6u0LMj3/QFpzl/GCX8JmtA78jY
 yBDs/I6ZiBu2UH7uoTcze9yCn7oF0JmgH6GSGMtMkvghXspXiIAgu+DIUqXPzA9nxlj4
 wUQC2zigW6KRNF7d3zu+lzRo8g8k/o6ybatkPaKFGzYXWpbX5yez8Qx/PvzKGzlGcREU
 AssuQ9yIsg1jOgYvYeBQp/S6j7z0Dx5XRad1af35c8fy0m+kinIguuxrhb0lGx4GVWrc
 wUyPmrhPTicTNIw6oWM/gK0bvsT5INnjm7r5z6idw7bkGR+VeJVa7bOYGb974rHE+jv1
 5ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ApokTc8mxObi8oLsmYtRa9frQO6t6d0mzitkU5awMsA=;
 b=gKiTHXSWiTazrakZKDSFYwLdCDsI9n5nwD+DlyX5GRYG2jyVqLjd1Gx/Gvjth2YhkZ
 xIy5GjiL9UxSwu/4WD59G3i5HUUG6HAwRcgh3uuguBdO4E6Ppg5WmB0bENXffrqkYMm6
 l9lFB1IBblNWjRJL3YqKAX4RfhqXvNrYz/tTPrGVR3x+4hJqUmPMtRZ5LT6LyadA8vop
 hymBX4aqOqw0DEXeRvic+ypw2mMXdsuzuXtyBSga841U4Hsiq/0it0whLL8OX7cGo/m/
 m8kk4H3kETEpj44SZGk8QNi1PorOsQs9pUui69Mm2gysT95YNOWBWPgJBLY5LOjDKfap
 igLw==
X-Gm-Message-State: AOAM530MCg2lh2hHYKV26Hwju5cblxFvz5myv0arRLD6ozURS9lm/BVU
 LAEWWU9D6dN7uQT77Cd4dZ57yzzt
X-Google-Smtp-Source: ABdhPJzyIkOm/xZ02NFnTH6W4iDNwHM/gJaa4hr0GPRjC4doNqTHl9+QaDOnw/R0q7UZnod0GL2mSw==
X-Received: by 2002:a05:6638:329d:: with SMTP id
 f29mr15989957jav.140.1629126605321; 
 Mon, 16 Aug 2021 08:10:05 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id w10sm5725935ioc.55.2021.08.16.08.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:10:04 -0700 (PDT)
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org> <YRp9rnCardsCukju@kroah.com>
 <20210816150653.GH1931@kadam>
From: Alex Elder <elder@linaro.org>
Message-ID: <687f29ce-6245-e549-9b7b-7cc2befba962@linaro.org>
Date: Mon, 16 Aug 2021 10:10:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816150653.GH1931@kadam>
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
Cc: Alex Elder <elder@kernel.org>, kernel test robot <lkp@intel.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 8/16/21 10:06 AM, Dan Carpenter wrote:
> On Mon, Aug 16, 2021 at 05:01:02PM +0200, Greg Kroah-Hartman wrote:
>> On Mon, Aug 16, 2021 at 09:46:08AM -0500, Alex Elder wrote:
>>> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
>>>> Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
>>>> is more memory-efficient, parallelisable, and cache friendly. It takes
>>>> advantage of RCU to perform lookups without locking. Furthermore, IDR is
>>>> deprecated because XArray has a better (cleaner and more consistent) API.
>>>
>>> I haven't verified the use of the new API (yet) but I have a few
>>> comments on your patch, below.
>>>
>>> 					-Alex
>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>>>
>>> I'm not sure I'm right about this...  But the actual change you're
>>> making has nothing to do with what the Intel test robot reported.
>>> I personally find the "Reported-by" here a little misleading, but
>>> maybe the "Link" line that gets added will provide explanation.
>>>
>>> Anyway, unless someone else contradicts/corrects me, I'd rather
>>> not have the "Reported-by" here (despite wanting to provide much
>>> credit to <lkp@intel.com>...).
>>
>> You are correct, "Reported-by:" does not make sense here.
> 
> There should be a Fixes-from: tag for bugs found in review (not style
> issues) but when I suggest it then people just say to use the
> Reported-by tag.

I think things caught during review aren't normally worthy
of specific mention in the commit message (though maybe in
the non-committed part under "---").  I mean, that's what
review is for.  And in the case of what <lkp@intel.com>
does, that's effectively a technical aspect of "review."

So I don't think "Fixes-from" (whatever that means) or
"Reported-by" make sense for this type of update.

					-Alex

> 
> regards,
> dan carpenter
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
