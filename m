Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8494E2621
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 13:13:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D1B843EF9D
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 12:13:39 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	by lists.linaro.org (Postfix) with ESMTPS id 7CF823EEE0
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 09:06:15 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id yy13so28470638ejb.2
        for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mt0VFhB/cCuPyGbbmavpLIyzsTNFvG4Vc/AfIj3zApY=;
        b=NmF37/lEaxfT5M2TGcYPyQIp9c0iopepl58SqhUvDu9K7LZLiOuaayFWTWseflPfsO
         JX7NDUoyGbjVXeIm3W8JbWd/4HDJ8tOLTCB63wZ6L8Nr+YUduPkGHzFfI1fiF9zqkT9m
         P3rPfvEoF5AmJnQtZWRXc2xgKq/pnaQmrewjS56TwrIr6tEJ8DZOTM538mc24TKZFmpE
         0k0bakJcvUSgedXhBQKYIyTpeKrtPfTstKfB/JNDF1h6SXHVu7s4trOgUoYY3YcQYqFy
         j1pSJ3xQF9LTlKY2oepQQ13IkmDkqnu7zYHM2IePJXV/q2+LOk8mgyLw0uqwztmMFagu
         QkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mt0VFhB/cCuPyGbbmavpLIyzsTNFvG4Vc/AfIj3zApY=;
        b=Q//cSzF27fJZ2gT08ULiJz6t4v826QS7D3Ys+z5nCO5VTS8kATSn7ltPpWMGFt/jgQ
         8lXiIXMsbEE6LVWPnN7Rr5Bt41Q2foOuGVdwVlOIryFosZtzDmY8uvu6/8DckhwszVY5
         rGhaRTGPhB7DKRLPjzkbh46aCUvo2PGZ8tNPXoYqO1mI4aqtKPChVktSNPy02Ti3Yp/r
         +iNZiXwuQj3pPoNraQFAUUotep1gU42SSSBXTaXTNS3m7hZplOFbFQeIcJ72Ge8Nf7nJ
         nqIZ2XOPgRXEeD09BjmWM52TZh0Qh4Ki2DdjEHOs4da6xGdnP3+4r3UuuBuT0Uy6J6U7
         tvww==
X-Gm-Message-State: AOAM531uiOAz6qLxgTIdcKJW5Wz6B79hJuBxTutFuCEoSXjEpTRiC1+q
	8g0+F4Ogptt+zU5lFK6L8s2niOuPexDtMw==
X-Google-Smtp-Source: ABdhPJwVFF2qOVXbaAyFvG0JRg6aagD1KaDmyF5Ceu3CSRh8UkE/rrnLpGcJIX3kct91TcwxEhpPtw==
X-Received: by 2002:a17:907:7e97:b0:6db:c1ef:6a68 with SMTP id qb23-20020a1709077e9700b006dbc1ef6a68mr18932062ejc.475.1647853574492;
        Mon, 21 Mar 2022 02:06:14 -0700 (PDT)
Received: from smtpclient.apple (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.gmail.com with ESMTPSA id w19-20020a05640234d300b00416baf4cdcasm7771528edc.48.2022.03.21.02.06.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Mar 2022 02:06:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220321084844.GG3293@kadam>
Date: Mon, 21 Mar 2022 10:06:13 +0100
Message-Id: <23587784-B0EB-4FDD-B5BC-DC1B16404DA7@gmail.com>
References: <20220319202058.2518847-1-jakobkoschel@gmail.com>
 <20220321084844.GG3293@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-MailFrom: jakobkoschel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: L25VKLMSLQ3RUK7J3SC4GNWABLYAQHV4
X-Message-ID-Hash: L25VKLMSLQ3RUK7J3SC4GNWABLYAQHV4
X-Mailman-Approved-At: Mon, 21 Mar 2022 12:13:35 +0000
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: codecs: fix type confusion with dedicated list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L25VKLMSLQ3RUK7J3SC4GNWABLYAQHV4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> On 21. Mar 2022, at 09:48, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> The subject says that it fixes a bug but it does not.

Thank you for your review!

I don't agree that this doesn't fix a bug:

> +		}
> 	}
> 	if (!data) {
> -		dev_err(dai->dev, "%s:%s DATA connection missing\n",
> -			dai->name, module->name);

Using 'module' when data == NULL is *guaranteed* to be a type confused
bogus pointer. It fundamentally can never be correct.

If I should still change the wording please let me know.

> +		dev_err(dai->dev, "%s DATA connection missing\n",
> +			dai->name);
> 		mutex_unlock(&codec->lock);
> 		return -ENODEV;
> 	}


> 
> On Sat, Mar 19, 2022 at 09:20:58PM +0100, Jakob Koschel wrote:
>> If the list does not exit early then data == NULL and 'module' does not
>> point to a valid list element.
>> Using 'module' in such a case is not valid and was therefore removed.
> 
> This paragraph is confusing jumble words.  Just say: "This code is fine".
> 
>> 
>> In preparation to limit the scope of the list iterator to the list
>> traversal loop, use a dedicated pointer pointing to the found element [1].
> 
> This paragraph is the information we need.  Just add something like
> "This patch has no effect on runtime".

As mentioned above, this code effects runtime (in one out of the two cases).

> 
> regards,
> dan carpenter

Thanks,
Jakob

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
