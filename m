Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDD540F41
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jun 2022 21:06:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4BFCE3F1AE
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jun 2022 19:06:18 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	by lists.linaro.org (Postfix) with ESMTPS id 7FA603F18F
	for <greybus-dev@lists.linaro.org>; Tue,  7 Jun 2022 19:06:16 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id h18so12965901qvj.11
        for <greybus-dev@lists.linaro.org>; Tue, 07 Jun 2022 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kEh88sbKY2YcFyazQQTZq8kRQuf4NWYNl5prd+A7y48=;
        b=gYX6KtqMiH3fY8cMln5DLy0EX4vHtjVqoAYzI6Vksz+6WrELrfbEFY0Bb7m9oBxg1T
         VRWjrY5E5cTjKdK5wJlCK3Jp7kECqZtMksp6HbJegpfMonchOSIiRekIWXQT+9L/Rv73
         8lRqQv5Y4Pg8c+L+mEYyQqRMEIAcerryv6QHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kEh88sbKY2YcFyazQQTZq8kRQuf4NWYNl5prd+A7y48=;
        b=YHDrytd6mfT+w2Q9TgU/MNT3BmrPm39uiBDHL2WT2xH6rKqCSd1zFHrqV6F2eIgjVF
         vp9M9ba9zrGjPYeFeinxWx2IKykBg+hcf+W8VSY/gf5ty4h5h01gQ10yNiadSdYEq8Y2
         t82SLYWN8eylsmHIKwnBOxaYxUGETkwDBCepwQOa8fpbRh2QfGYBkDpyyLZ5IjNNSXZy
         uestHZC783G1upXah91Q/K7ng+TGhHKsYTSyJN5H44Ho2IJD2MNf0YXWWaG8BHWokaK2
         jyZ+pyNzRn3PoMEqNIVvgVaVucbdjTp2P0LoHSClXczM4R9FbMuNGX908jRVsUc4XW2M
         Y8cg==
X-Gm-Message-State: AOAM530EZmzE4RniIHH68pcixMMb1lYRRN7RCVdkKiBNgM7r1DOmN3S2
	dAKP+VratG6f+HX3lnPabWLWag==
X-Google-Smtp-Source: ABdhPJwU3d8oEkz5X5lKa+Lm36JdssARY1Af5Ux3+KI/0zWJyOPBsWDSAAOCUA57rRSoxhn10Jn12g==
X-Received: by 2002:a05:6214:1110:b0:46b:a979:d63 with SMTP id e16-20020a056214111000b0046ba9790d63mr7180252qvs.100.1654628776157;
        Tue, 07 Jun 2022 12:06:16 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id i21-20020a05620a405500b006a6ac4e7ab4sm8577017qko.112.2022.06.07.12.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 12:06:15 -0700 (PDT)
Message-ID: <8012a613-91ea-466e-f77e-6fc5453724f5@ieee.org>
Date: Tue, 7 Jun 2022 14:06:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Jared Kangas <kangas.jd@gmail.com>
References: <20220605231806.720085-1-kangas.jd@gmail.com>
 <20220606130626.GX2146@kadam> <Yp9/kqBUzpArfPdn@fedora>
 <20220607183921.GQ2168@kadam>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220607183921.GQ2168@kadam>
Message-ID-Hash: DEVEDXT3CPCY6IC35QW3N2KEKTN3LJZ2
X-Message-ID-Hash: DEVEDXT3CPCY6IC35QW3N2KEKTN3LJZ2
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DEVEDXT3CPCY6IC35QW3N2KEKTN3LJZ2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 6/7/22 1:39 PM, Dan Carpenter wrote:
> On Tue, Jun 07, 2022 at 09:40:50AM -0700, Jared Kangas wrote:
>> Thanks for catching that! Is there anything I need to do to add the
>> 'Fixes:' tag to the patch? From my understanding, adding tags is done by
>> a maintainer later on, but I'm new to the patch submission process so I
>> want to make sure I'm not missing anything.
> 
> No, it's up to the person sending the patch to add the fixes tag.

And FYI, "git blame" can be your friend here.

     git blame drivers/staging/greybus/audio_helper.c

It looks like commit 510e340efe0cbd is a possible
candidate, but I'll leave it up to you to determine
that.

					-Alex

> regards,
> dan carpenter
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
