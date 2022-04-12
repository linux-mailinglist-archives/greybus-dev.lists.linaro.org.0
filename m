Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F84FCC03
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 03:55:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2FD933F066
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Apr 2022 01:55:18 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	by lists.linaro.org (Postfix) with ESMTPS id B0DB13EA1B
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 01:55:16 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id p21so20846763ioj.4
        for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 18:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oBVB6OMaVmW4VIDZAaEbON7kMyciD94DEsz9UZvj85o=;
        b=QjwzsS6usi7V1XeKXWF4Vglaq7eM5rnAiKiLughIP0ghQ//qBSt6pXF8Wy65karFKN
         f5jGgz69NhX4t81wiicmvfqWge29IsgGZrbnJjrHvbdZ2WShrE8PlKzG0n6jd0SJM/Yl
         7/Ls7B7PW47llnfhBXZ/+IzbGcfA7wRwyCQ4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oBVB6OMaVmW4VIDZAaEbON7kMyciD94DEsz9UZvj85o=;
        b=6WmZ/Y0hUcpAlvfehqncGlWvl7AUVH1C46JHQgrEgWf0Me4xAR4tRzdlC7PX9zNOSS
         A5OdfmgQPxSy2cEKCeVeB7m09kds3gJwz3BEY1vbnnoBkzZFuIUZUywiTGQUtqJIcZVy
         d5heA02NCeu5gSkXdEYWI04KXRcH6hxD5Gv8yvOd9ty30+uVKIRL6AYoua/264QEcwE/
         fVhnwbiX3zDXjMszpRfQWqfKOZlnAwEZRu0IQyLx0KPpYb8wLH7IsUPrOJilLXSCjZjd
         qeeLaQP4i8lIbwvySYyt/apGYAOA2JZPpDHIG9FaF8fYiPXRo6FzdvNekofuiJUbCam4
         TnIQ==
X-Gm-Message-State: AOAM531hVHhAd2XjBZqfOFtfUPqFgQe8OtuwPCaUlt81ZyW098VpdMAP
	9NmkE14uXvkzW0DLeNWepjGVNA==
X-Google-Smtp-Source: ABdhPJyr6vt6puQIS2gbji09gkrJPhnfDSc5vipjeTwUTA07rThe82vQKJkBr4KzhKq/ChbxNSs8wQ==
X-Received: by 2002:a05:6602:2a45:b0:648:b21c:6f49 with SMTP id k5-20020a0566022a4500b00648b21c6f49mr14820942iov.206.1649728516198;
        Mon, 11 Apr 2022 18:55:16 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id a2-20020a5d9ec2000000b00645ab33390dsm21121751ioe.9.2022.04.11.18.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 18:55:15 -0700 (PDT)
Message-ID: <9c3bdbce-e898-696b-b645-6e566faffa85@ieee.org>
Date: Mon, 11 Apr 2022 20:55:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, johan@kernel.org
References: <cover.1649712572.git.jhpark1013@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <cover.1649712572.git.jhpark1013@gmail.com>
Message-ID-Hash: ABPFO4FKIKFLKQGPA7E5CZQRI3BCUVIQ
X-Message-ID-Hash: ABPFO4FKIKFLKQGPA7E5CZQRI3BCUVIQ
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/2] staging: greybus: fix warnings reported by checkpatch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ABPFO4FKIKFLKQGPA7E5CZQRI3BCUVIQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/11/22 8:50 PM, Jaehee Park wrote:
> The first patch corrects a typo in a comment. The second patch fixes
> 'void function return statements are not generally useful' warning.
> 
> Jaehee Park (2):
>    staging: greybus: correct typo in comment 'Atleast' to 'At least'
>    staging: greybus: remove return in an empty void function
> 
>   drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
>   drivers/staging/greybus/audio_codec.c    | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 

These are really trivial patches.  Whether the second
one is even worth changing is questionable (it represents
"code churn" without really adding value).

That said, you've properly submitted the patches and I
have no problem with either one.  So someone else can
object, but if they do not:

Reviewed-by: Alex Elder <elder@linaro.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
