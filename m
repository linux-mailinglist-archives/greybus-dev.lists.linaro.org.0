Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9B84C5FFA
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Feb 2022 00:57:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5F4D3EEFD
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Feb 2022 23:57:58 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	by lists.linaro.org (Postfix) with ESMTPS id EBA523ECBC
	for <greybus-dev@lists.linaro.org>; Sun, 27 Feb 2022 23:57:55 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id r7so13023417iot.3
        for <greybus-dev@lists.linaro.org>; Sun, 27 Feb 2022 15:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TYixXH/oSVNIYPjWy8IDeErfQMBt7NeciGEbuByoJUQ=;
        b=VA7Y7/hwNTpAG0EJBvjzNcqWEEoLvSuaQCNj01nO45OyMQcgooOoCeTcGzsvRipjXT
         GR51Exj8tHYQvvBj7rj4BWHnSURg64uycJzHdUCB+hGxEtEhlwx2pPdKlhw0XhHwjAE/
         I4bLKsSa7ST5UvIHRTX2rxKh1qtw9ZBdmZ77wJDCw6OPEltA1/Pz2/7JbQRL0duYZ4ct
         a7VUK+N8cmAKsjrWIe0Rajg2EbIFsIgRyubHIXT65zHok28ikdqymV+/J+ecIosK77WB
         vpTaCXz61HY+ci7o/cRo3ZW5ylwVRVT+7wiyD0oTOFySlCVCR7thfpDnSjzQN84bD+HM
         seNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TYixXH/oSVNIYPjWy8IDeErfQMBt7NeciGEbuByoJUQ=;
        b=ZfGglpBb/mi43Qx8HpeTllmgmpHsCgWi09f7Aps2GOAZw+PfkDfv3mtsbeBQ5DC+gU
         l+lcq5pAZAiwzLuM8unyLvlYM11TbP7fAhQWoj8Sh9OWrti5Q+CNeC9MBmGymJTrnKJW
         W1yniyCRjvwfMa+OdgFlOCiX5LFkV8VFUSUIMz6qDygyvgYATlNo48Wg1KD0n0AW9/WT
         qMcERrAH9GipaEVKwHvluOO1DO+CeQAwJ/ReqYVNZN2LfO0MSiJsM/1zmqXijVN0Vmdn
         w36NX8vEGXkN1C1IIDfDcicxVs+/O7dJLS9zbr9lNYFfCUpjRXNQwRAIEgSWEV6uKgbE
         5igw==
X-Gm-Message-State: AOAM533/YHfQ2uZhQeBON3YA2pdej6cOWZXMAP912kW/ZJiLjtFbmzhr
	8TdEs+RZIS9BPg+140qG/FcIQhff
X-Google-Smtp-Source: ABdhPJyPtYXXq4eTx/zm7hkEn1uc7x7ywQuCdrH5tLSdhR5RU9smY5dt5X0iXebRMULNf0pZ7UBpzA==
X-Received: by 2002:a02:c64e:0:b0:311:b1b4:1a08 with SMTP id k14-20020a02c64e000000b00311b1b41a08mr14572997jan.230.1646006275352;
        Sun, 27 Feb 2022 15:57:55 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id n7-20020a056602340700b006409737fa99sm5093280ioz.27.2022.02.27.15.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 15:57:54 -0800 (PST)
Message-ID: <72ff1b04-4f37-9851-a6e6-aded72b46c83@linaro.org>
Date: Sun, 27 Feb 2022 17:57:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20220227215408.3180023-1-arnd@kernel.org>
 <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
 <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Message-ID-Hash: YBBIICBMLNAMIZ3CZW3BSORS2CTOZYOO
X-Message-ID-Hash: YBBIICBMLNAMIZ3CZW3BSORS2CTOZYOO
X-MailFrom: elder@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YBBIICBMLNAMIZ3CZW3BSORS2CTOZYOO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 2/27/22 5:11 PM, Linus Torvalds wrote:
> On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>>
>> Glancing at the Greybus code, I don't believe there's any
>> reason it needs to shift a negative value.  Such warnings
>> could be fixed by making certain variables unsigned, for
>> example.
> 
> As mentioned in the original thread, making things unsigned actually
> is likely to introduce bugs and make things worse.

Understood.  What I meant is that the shifts were producing
single-bit masks from plain int values that range from 0 to 10
or something (in a for loop).  Looking again though, that it's
not so simple.  Regardless, your point about the warning is
good and I won't plan to "fix" this.

Thanks.

					-Alex
> 
> The warning is simply bogus, and the fact that it was enabled by
> -Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
> be fixed in gcc.
> 
> So don't try to "fix" the code to make any possible warnings go away.
> You may just make things worse.
> 
> (That is often true in general for the more esoteric warnings, but in
> this case it's just painfully more obvious).
> 
>                Linus

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
