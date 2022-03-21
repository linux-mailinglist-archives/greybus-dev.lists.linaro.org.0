Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D04E2623
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 13:13:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC56B3EF89
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 12:13:40 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	by lists.linaro.org (Postfix) with ESMTPS id 3332A3EF7D
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 09:27:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w25so17020763edi.11
        for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 02:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=lFsDWl+VJdRlH1sYqyaS7hLxexcdMEqqhguN78mfy8c=;
        b=dC0lgqZosvcUacMyEqwuW0ThHJ/D8J1xh/TRRKdTaooqxUcUYptD0K+yYArEJf3H/j
         xXIWQF9ijHb8L8hyx3uv0m4EtG8YMXlOi4ODzlF4+AOND4m8vETjo0oYLDb2MLJNKKyR
         mQ1Z0AyJK86dnEdxOMJxrLknU0zo0VMcqtyaYMA2l8AvR0BpMmMf9URZFaFyEnLGmJha
         1QERrkE6Qk9LOcpQWLgT+yGRYRg6x3h6rFA6fw9n1jW7c2Ssl0PR8YTXS4zu02lKxl1A
         7XZOyv9YD4eYY7f/lgWQbyDCf/yqeKu1Jnzy180i3zfPxeuBd8+HpWWeT0JFg/01QA18
         Um5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=lFsDWl+VJdRlH1sYqyaS7hLxexcdMEqqhguN78mfy8c=;
        b=mf1RsP1nhML9XmnS+DEQ+PEctzi6LXkk5H9asTIt1snzOtcQtHZAl0bRABsKTUjlEY
         OxrO6fyskazEb81hBirvExZoNrr//8R519epmNJMQ0V4iNgNcoai9WHTI8F/AjW0Mgzo
         ZbG+kRuQlL0T277zSEhm8a4+vgKBmlQC14BLz9CxK8JwB4Kacr9lEX5N+sfbnzX70JH7
         Kh38qvLVAbAhi7mUU/giyCwYecLM1sOF2ZILJIv26DTxZ0X49Y2h4//VwCNvGtnsIHAz
         NrgFGmrf9QofBzwCRQJzlHaEc6UFAq/+WjvMOLzMpfUWZkh1hX15zoQsI3elzhOEkCzm
         priQ==
X-Gm-Message-State: AOAM530qpv3VPKaJAOzm8+rYMBFsR5J4PMAjfDgH7eDuULtzp15AsHCe
	+YT8e063E0jbkXDI40phBDIGfgSauWxjww==
X-Google-Smtp-Source: ABdhPJzRs23bgn/uEHK3maxGciOp0ZhqC5tIWli5C8r3oBZ6fKGbzendUzVLC+nR+wC1Q+v4tPr1MQ==
X-Received: by 2002:a05:6402:4247:b0:419:3990:3db6 with SMTP id g7-20020a056402424700b0041939903db6mr4593102edb.193.1647854832264;
        Mon, 21 Mar 2022 02:27:12 -0700 (PDT)
Received: from smtpclient.apple (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.gmail.com with ESMTPSA id l12-20020a056402028c00b00418f7fc4bd8sm6133003edv.91.2022.03.21.02.27.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Mar 2022 02:27:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220321092132.GI3293@kadam>
Date: Mon, 21 Mar 2022 10:27:10 +0100
Message-Id: <56102C8D-DBFF-43A5-9641-04577F01AB6D@gmail.com>
References: <20220319202058.2518847-1-jakobkoschel@gmail.com>
 <20220321084844.GG3293@kadam>
 <23587784-B0EB-4FDD-B5BC-DC1B16404DA7@gmail.com>
 <20220321092132.GI3293@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-MailFrom: jakobkoschel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IQV76OJC6DLVSLPYTH4XRMR3J6BXUD6I
X-Message-ID-Hash: IQV76OJC6DLVSLPYTH4XRMR3J6BXUD6I
X-Mailman-Approved-At: Mon, 21 Mar 2022 12:13:37 +0000
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: fix type confusion with dedicated list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IQV76OJC6DLVSLPYTH4XRMR3J6BXUD6I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On 21. Mar 2022, at 10:21, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> On Mon, Mar 21, 2022 at 10:06:13AM +0100, Jakob Koschel wrote:
>> 
>>> On 21. Mar 2022, at 09:48, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>> 
>>> The subject says that it fixes a bug but it does not.
>> 
>> Thank you for your review!
>> 
>> I don't agree that this doesn't fix a bug:
>> 
>>> +		}
>>> 	}
>>> 	if (!data) {
>>> -		dev_err(dai->dev, "%s:%s DATA connection missing\n",
>>> -			dai->name, module->name);
>> 
>> Using 'module' when data == NULL is *guaranteed* to be a type confused
>> bogus pointer. It fundamentally can never be correct.
> 
> Ah.  I did not read all the way to the end of the patch.
> 
> The bugfix needs to be sent as it's own patch.  Just the one liner.  It
> needs a fixes tag as well.
> 
> [PATCH] staging: greybus: fix Oops in error message
> 
> The "module" pointer is invalid here.  It's the list iterator and we
> exited the loop without finding a valid entry.
> 
> Fixes: 6dd67645f22c ("greybus: audio: Use single codec driver registration")
> Signed-off-by: You
> 
> 	if (!data) {
> -		dev_err(dai->dev, "%s:%s DATA connection missing\n",
> -			dai->name, module->name);
> +		dev_err(dai->dev, "%s DATA connection missing\n",
> +			dai->name);
> 		mutex_unlock(&codec->lock);
> 
> We're happy to apply the other stuff as well, but we don't mix cleanups
> and bug fixes like that.

ok great, I'll separate and resubmit both. Thanks!

> 
> regards,
> dan carpenter

	Jakob

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
