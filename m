Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 736C2588C35
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Aug 2022 14:34:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A69ED3F219
	for <lists+greybus-dev@lfdr.de>; Wed,  3 Aug 2022 12:34:53 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	by lists.linaro.org (Postfix) with ESMTPS id 550863EF69
	for <greybus-dev@lists.linaro.org>; Wed,  3 Aug 2022 12:34:51 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id h188so19372787oia.13
        for <greybus-dev@lists.linaro.org>; Wed, 03 Aug 2022 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UWrNvVp7YUZj8MmbTig9VeiLZuSQe+hksBAGZfvUdBo=;
        b=cm2gRhjRwXYwxYHmFwee7XBW4CLtFAV/S07uj1an18jQtRIxgH/xE/vLtH0QFUaHqD
         w+SaMfXgygW/4faReaidGDU+znpMrNPAzjPDCJI5zoc0kftW1rGC5Rk4mwgMbJMYpxKB
         7jX3JfvDSiO1jDWqqe7meCNyLRjmwUgbgkZTAMKStQCPhNjSvZjYccXZoEyTK9wGuS0+
         9qRkhF618vXA6RYKQAp2obZ2F/Dc8aConacM9fnbPHfuTGPa4Ev4xXakycVCqZgWDJ3m
         b/gprF5+J10t/8N4pW9HlsYpABaqF4xSDmbmn4Z4xPj41ypvQoLDHnZap1wCHwbrPr9l
         /k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UWrNvVp7YUZj8MmbTig9VeiLZuSQe+hksBAGZfvUdBo=;
        b=wZ/a4wb9wqCI76wnuhwrEVcfvR/ziuZ+8MbeizDqiIzEuQJtSNsFSS8tn7pE3HrHyg
         VX60+IOjEUzmHf2YoVrmjqJ14t/V7fRnWv0Iw2988cOXdxQnoDCoeyI7PX9JMEDWHw6m
         Lq7vPvitUilUezOSknLT/Nfe6SpyvSHXPwIoELGjVqLQJAO+NRCT8sLojoeElYXuBOh6
         zPrjE5hsV4zL1WAll7zqNvnwt4Q8RGxubfQBKxiVAH5o9/2PjkA+y1eQiYOgo0yJxk2+
         WR/qtl8R+FnXj6ad9ME40UEZQB1Egh3EAAYFzIhuKR0jICO+EZE1w5w/EwI0+rXo1vb+
         4elQ==
X-Gm-Message-State: ACgBeo0G3Jprna9ENP0WBAWNuWB6u3jsROh8VvjboMEPeAFzRzYXMVfk
	YboRx5WuRTvIxK8MPwG8ShZZs/cx
X-Google-Smtp-Source: AA6agR6kSpPZVxObp4lEc841dhz2wr+j2UZYAn4pNEJahO/BdOfBHzbHBe425OJvWYB2/g5z0QlgZA==
X-Received: by 2002:a05:6808:2013:b0:33a:921b:33e6 with SMTP id q19-20020a056808201300b0033a921b33e6mr1532318oiw.1.1659530090701;
        Wed, 03 Aug 2022 05:34:50 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id a24-20020a05683012d800b006339b36127dsm1420706otq.3.2022.08.03.05.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 05:34:50 -0700 (PDT)
Message-ID: <a42bb5d5-4783-b755-5479-48c5bcdbbedd@linaro.org>
Date: Wed, 3 Aug 2022 07:34:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220803062258.1650792-1-ye.xingchen@zte.com.cn>
 <YuoWCSQCnNU3DrUL@kroah.com>
 <81d363ba-82ef-d556-2d77-083e3b2d9d02@linaro.org>
 <YupqXVa+RYm4Ul+m@kroah.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <YupqXVa+RYm4Ul+m@kroah.com>
Message-ID-Hash: QVSUXD7WIYP7MWPZSF6CRX3NAKJ55UZ2
X-Message-ID-Hash: QVSUXD7WIYP7MWPZSF6CRX3NAKJ55UZ2
X-MailFrom: elder@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: cgel.zte@gmail.com, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH linux-next] staging: greybus:using the
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QVSUXD7WIYP7MWPZSF6CRX3NAKJ55UZ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 8/3/22 7:30 AM, Greg KH wrote:
>>
>> Ye Xingchen had nothing to do with your receiving the message twice.
> Ah, ok.  But they did send a number of patches like this while after I
> had sent my first request to not do patches in this format anymore,
> which is what caused my response here.

I didn't realize that.  That explains why your response was
"Please follow researcher-guidelines.rst."  I didn't initially
understand why it was that instead of something more directed
at the content of the patch.

I *thought* it might be because "Zeal Robot" might be something
new, and so considered experimental?

Anyway, I think we're clear now.  Thanks.

					-Alex
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
