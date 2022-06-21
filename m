Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 182325552F7
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jun 2022 20:08:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC9F43EF72
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jun 2022 18:08:17 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	by lists.linaro.org (Postfix) with ESMTPS id 7ECF63F0CC
	for <greybus-dev@lists.linaro.org>; Tue, 21 Jun 2022 14:36:46 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id u12so27935841eja.8
        for <greybus-dev@lists.linaro.org>; Tue, 21 Jun 2022 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=GJLwzs2N2pKacf0ZdpQ3Wu/SeO3mykpG6QqRYLAhfmk=;
        b=N6BE6BxVqA8S6MZ6jXtPrW+5fvbwqzTVoAHhh3M6wcy6Cp3FV3fMh6BLMAvKVNnIfu
         N3CoCOxglGEajhXHoucNcwECSyZ/r+5cwTJu0HYMEaNbYQEZAXIf0ZLUR3VVuqXCKy/M
         +cPfNworLHTQ6NGyNeJOo4OYiEmoloxSMmG7tq/orOseY2bXZvl0/T7T3dv/VDsT6jP5
         TF8L4ho8OddkWkPEJ/HtUuM8JU1NqfqYsQpQdrNW+1GuxdhOSAKbdjT6TtYj82lAIH68
         avk9dDAYHsqPI4Kwg6aZPdtWGSyJDDhDzeVgox8yE0RAvGFjz6ykgpn2s6NlcobiiEBB
         LnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GJLwzs2N2pKacf0ZdpQ3Wu/SeO3mykpG6QqRYLAhfmk=;
        b=7WkVUIh49qQKZ1t1QwbFHgdh05Ad/P3Vih2P7N8T9LDIKeREAdoVPJ01Ltaop0ORAw
         cl5JY0z+MM3L9UaAmY7WglhiqUkD92opNDdsYSwvcjEeWlTy7AyQZqh+Yr9EcEVUXFQy
         NdD/a72+P23Hk1tW+AhkmILdL2VOlrYEKtTIjymJNyCh1nTmejc3F5g6GQQt2DoaTX0j
         Q5QirK1yOsxYwyTkn8m3XaDwnZbhgBs8yO1iS2WHvmMyZ8smN5AhytKe58Z9vnkrZK1R
         dk71LWNBTqnDSm5SNv94CRQRFm5wbpILK4DDp8AACIzTtVY/T8QEhMS2dXnF7FShI8l8
         6gbw==
X-Gm-Message-State: AJIora/XP6qmDgmoQichy65KeDswlB5Z0LZi5rcYMRTICgpObBSpHZ3G
	zZpGjFX3q/joydWfjhJ3Fdp5Xe69WC3vzoRvt1g=
X-Google-Smtp-Source: AGRyM1sgOphI4tXDIE/cP6e1t4c0owyLW5pNlViUlFMGQUq41Aw+paKFZiYauH2ZneR1k5TX7rpbx+1VF9WS4NhuzOI=
X-Received: by 2002:a17:906:9b96:b0:711:d21c:1b0b with SMTP id
 dd22-20020a1709069b9600b00711d21c1b0bmr26352742ejc.365.1655822205405; Tue, 21
 Jun 2022 07:36:45 -0700 (PDT)
MIME-Version: 1.0
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 21 Jun 2022 22:36:04 +0800
Message-ID: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
To: vireshk@kernel.org, Johan Hovold <johan@kernel.org>, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
X-MailFrom: mudongliangabcd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: D3DXVPJJZBREKPV3ZBSBXPETGLTNRCL2
X-Message-ID-Hash: D3DXVPJJZBREKPV3ZBSBXPETGLTNRCL2
X-Mailman-Approved-At: Wed, 22 Jun 2022 18:08:16 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Unitialized Variable and Null Pointer Dereference bug in gb_bootrom_get_firmware
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D3DXVPJJZBREKPV3ZBSBXPETGLTNRCL2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi maintainers,

I would like to send one bug report.

In gb_bootrom_get_firmware, if the first branch is satisfied, it will
go to queue_work, leading to the dereference of uninitialized const
variable "fw". If the second branch is satisfied, it will go to unlock
with fw as NULL pointer, leading to a NULL Pointer Dereference.

The Fixes commit should be [1], introducing the dereference of "fw" in
the error handling code.

I am not sure how to fix this bug. Any comment on removing the
dereference of fw?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a4293e1d4e6416477976ee3bd248589d3fc4bb19

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
