Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB339B917
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Jun 2021 14:34:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 643A760F06
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Jun 2021 12:34:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8107F60EFF; Fri,  4 Jun 2021 12:34:14 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B8FB160F06;
	Fri,  4 Jun 2021 12:34:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DEA6660EE1
 for <greybus-dev@lists.linaro.org>; Fri,  4 Jun 2021 12:34:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D587160EFF; Fri,  4 Jun 2021 12:34:09 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by lists.linaro.org (Postfix) with ESMTPS id CDB3560EE1
 for <greybus-dev@lists.linaro.org>; Fri,  4 Jun 2021 12:34:07 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so8907008oth.8
 for <greybus-dev@lists.linaro.org>; Fri, 04 Jun 2021 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tCu/tKeYJwFaB3OgK7bagOEU6jq2x5jscMl3fnvsW4U=;
 b=qnFJVP/DW5Te8bJnZoC2h1qT0G1R0vO9fkYS5f86+H4eEFZNB4QZQXAvpUr7Pn5Owv
 SaHLAHFjSrMFdaVxjlgur5uvyZPRHgotUV+2TjuI9BM47xZX+uLq2WuJvmRj/vOom6AV
 mjPUniSxHJ1Apdu9EamFo9v8LPDBNovSP0C7QlhoXh8ZE+qRNi3ygF0axGGMgwycg4QX
 dONIz8rOqEGNz1hNS5/uBmWmMgAyD5bGfTbmGL3wUwYhz5/L/46bEu6K/b8hVe4NmHfR
 45Cnc3QfFb13qx2VeqkTK/jobUDS32F2IN4mA793UFCxIhQLaLPEKnbCm/OdEJ+C/H58
 TR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tCu/tKeYJwFaB3OgK7bagOEU6jq2x5jscMl3fnvsW4U=;
 b=HuX2+cRb8PUgu2vnO6aB5fvrSOBOVoQidSFgKTHW6K8i3jLfE8ZY5NgYED7v5iSxGy
 dGOhnsXo3M8q//eh75VB+lSENIsrbSmt9H+mCS24cUM1lNxKoPaf0+iWQ9UsVtbnHD/b
 9LULDF4rxpHtNA7LvG594Vzx8ux6Wmily4BsA86NXdWRPl6R0V2qJOdrfkwfvSGyOnb6
 y/TrNXdt2RxGvTY4e/VeAu0MyHLRIxP3yKBzgKrzO64ljVWX1AZ/VjCeTf1MTNmfOYq9
 CU1M1VdMTv8eAJfPXnBh8evipiJ6nXzDkhYv8ntD9vdHQIL4wlsRygGLup4fZOCwRH94
 pJJw==
X-Gm-Message-State: AOAM533H+Mbyea3Zsd4n7JDomS7vDD/MOeDiDhWctDXghO/A7CTatqlc
 wDmQcoDN58oLPuFVC3UpkoEmtlm2
X-Google-Smtp-Source: ABdhPJx/leSy51Y3cV58L2zpY1aK2i6EasrduwOlR++peaXucg2t2uW8ciCzlwcdAECGF6C5CeU/lA==
X-Received: by 2002:a9d:29:: with SMTP id 38mr3622473ota.30.1622810047206;
 Fri, 04 Jun 2021 05:34:07 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id a7sm403852ooo.9.2021.06.04.05.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 05:34:06 -0700 (PDT)
To: David Laight <David.Laight@ACULAB.COM>,
 'Manikishan Ghantasala' <manikishanghantasala@gmail.com>,
 Alex Elder <elder@ieee.org>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
 <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
 <10ad30e2-c906-b210-bf0e-5e20b6de1993@linaro.org>
 <c29b5c97f97b48c894917647915bf510@AcuMS.aculab.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <613239d4-c4a6-8585-5f9e-0241f0caa5ec@linaro.org>
Date: Fri, 4 Jun 2021 07:34:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c29b5c97f97b48c894917647915bf510@AcuMS.aculab.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
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
Cc: "greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 6/4/21 3:13 AM, David Laight wrote:
> Yes, and it isn't at all clear what it actually means.
> If the value of a bool memory location isn't 0 or 1
> what does 'bool_a & bool_b' mean.

I think this discussion is done, but I wanted to point out
that the above expression is incorrect.  It might be valid,
but it would be bad code.  A Boolean, when properly used,
should only be compared with true and false (or the result
of another Boolean expression).  Therefore "&" is not the
right operator, "&&" is.  The reason is similar to why you
would never use ~bool_a, you use !bool_a to invert its value.

					-Alex
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
