Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247D3FB6E0
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 15:20:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1A7361F45
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 13:20:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D51C261033; Mon, 30 Aug 2021 13:20:33 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A7C0E60A66;
	Mon, 30 Aug 2021 13:20:30 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 82A2160501
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 13:20:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 807916073C; Mon, 30 Aug 2021 13:20:29 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by lists.linaro.org (Postfix) with ESMTPS id 7A97860501
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 13:20:27 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id q3so19798310iot.3
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WKeT62ZadWDNocW3Ll/HW/hDyCa9+Jb52I2zuSuGv8I=;
 b=D6Lakt9yDWreyBDiRnMhUGB0xjXpntWU5IEh/lIaDXuQtc9m9IqAPv+lefK8iIfTET
 qTWt/9H/DgGcVNm0rFd5ddIT1vOqVR1v42iTIbXxv/nHIKPDQOGVMa1mMddL0WrHx+YJ
 ECW2qVbbwcA/otpaYLM1ylSzpNmpsA0kt0ggU0LiAQYHjXHgPjcuLzaJaeJZxOR7v65v
 x7m8jzUsWhRtzbN40jjEs69tSkywqdEuCLWWT7gzh6SHoqbpSjx3Qqx0cZyswa6ERVWY
 OnzDMKWqJmA3RJTWWVY1Ftyzg3Ilwq4oqjAxpTg2RHlyq4eXiU64FmIEaCmCjUSATU+F
 IPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WKeT62ZadWDNocW3Ll/HW/hDyCa9+Jb52I2zuSuGv8I=;
 b=S8bwii/tP8BAUGNpJCaSMsRp2ct2De7WnvG6dsPz3ZZXoYbIY1mgNwI0eAmzY1+3PY
 hXI5Aj0pr4lvpiHwp0YUP4LyrDzCuPsgdK9QWRDLEvtDFOjLj/eH8xTOPXheOY0yNGFx
 JwFMqWg2tzVn5mAK6Sg48tPkCzHzvjnJhkzmp2DegzYRPqCutBxDuWe2ldAPMIZ7gI1q
 2/dyoXk0HRMbHzhpECIg6VPkk71PuC77b6JqD8Ox4zPMAxi4cqqvKBVoPl32z58ldVU1
 fb6h43tfV9R9teC2pe4t/UtOeN4Oync8tlM/Cgyx0JcmlppW9M92npyjouW9t/umKaO+
 C7UA==
X-Gm-Message-State: AOAM530Cs4wkQrKWTYl2HZEgxpr3Fo3xHGAJRVCpQ+lVpduWF2Avn4vY
 uor1s2gRUhBuUVQLcREuUHoK5b8U
X-Google-Smtp-Source: ABdhPJxdAZVSMUUC/poZw8meLf37RZC8FmhD1StS6b+WVSZk0XkojKPb6/PuOqSm65UQzkkpWRUe7g==
X-Received: by 2002:a5d:9681:: with SMTP id m1mr18008859ion.113.1630329626767; 
 Mon, 30 Aug 2021 06:20:26 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id h9sm8322370ioz.30.2021.08.30.06.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 06:20:26 -0700 (PDT)
To: Johan Hovold <johan@kernel.org>, Matthew Wilcox <willy@infradead.org>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
 <YSzMB80NOkNvdjy1@casper.infradead.org>
 <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org>
Date: Mon, 30 Aug 2021 08:20:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v4] staging: greybus: Convert uart.c from
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
Cc: linux-staging@lists.linux.dev, Alex Elder <elder@kernel.org>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 8/30/21 7:33 AM, Johan Hovold wrote:
> On Mon, Aug 30, 2021 at 01:16:07PM +0100, Matthew Wilcox wrote:
>> On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
>>> Whether the API is better is debatable. As I said, almost no drivers use
>>> the new XArray interface, and perhaps partly because the new interface
>>> isn't as intuitive as has been claimed (e.g. xa_load() instead of
>>> ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
>>> I know.
>>
>> I can't just slap a 'deprecated' attribute on it.  That'll cause a
>> storm of warnings.  What would you suggest I do to warn people that
>> this interface is deprecated and I would like to remove it?
> 
> I'd at least expect a suggestion in the IDR documentation to consider
> using XArray instead.
> 
>> Why do you think that idr_find() is more intuitive than xa_load()?
>> The 'find' verb means that you search for something.  But it doesn't
>> search for anything; it just returns the pointer at that index.
>> 'find' should return the next non-NULL pointer at-or-above a given
>> index.
> 
> We're looking up a minor number which may or may not exist. "Find" (or
> "lookup" or "search") seems to describe this much better than "load"
> (even if that may better reflect the implementation of XArray).
> 
> And no, I would not expect a find implementation to return the next
> entry if the requested entry does not exist (and neither does idr_find()
> or radix_tree_lookup())

For what it's worth, I think of "find" as meaning "look up this one
thing, and return it if it's there (or tell me if it's not)."  That
is irrespective of underlying implementation.

That verb sometimes might mean something else (like create it if it
doesn't exist, or perhaps "get it or the next available" as suggested)
but I wish we had a slightly different naming convention for those
things.

The XArray interface was designed to better match typical usage of
IDR/IDA, as I understand it.  And its name suggests it is modeled
as an array, so "load" seems like a reasonable verb to mean returning
the value associated with an identified entry.  (Even though the
"doesn't exist" part doesn't match normal array semantics.)

So I guess I agree in part with both Johan and Matthew on the
 meaning
of "load" as used in the XArray interface.  Either way, that *is* the
interface at the moment.


I have been offering review feedback on this patch for three reasons:

- First, because I think the intended change does no real harm to the

  Greybus code, and in a small way actually simplifies it.

- Because I wanted to encourage Fabio's efforts to be part of the

  Linux contributor community.

- Because I suspected that Matthew's long-term intention was to

  replace IDR/IDA use with XArray, so this would represent an early

  conversion.



The Greybus code is generally good, but that doesn't mean it can't

evolve.  It gets very little patch traffic, so I don't consider small

changes like this "useless churn."  The Greybus code is held up as
 an
example of Linux kernel code that can be safely modified, and I
 think
it's actively promoted as a possible source of new developer
 tasks
(e.g. for Outreachy).



So aside from the details of the use of XArray, I'd rather we be
more open to changes to the Greybus code.

					-Alex

> 
> Johan
> _______________________________________________
> greybus-dev mailing list
> greybus-dev@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/greybus-dev
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
