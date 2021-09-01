Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB033FD942
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Sep 2021 14:09:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B03126056F
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Sep 2021 12:09:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1A0AD61A44; Wed,  1 Sep 2021 12:09:25 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD63A60FFF;
	Wed,  1 Sep 2021 12:09:22 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E9CEA6056F
 for <greybus-dev@lists.linaro.org>; Wed,  1 Sep 2021 12:09:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E574260F1F; Wed,  1 Sep 2021 12:09:20 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by lists.linaro.org (Postfix) with ESMTPS id DFBE46056F
 for <greybus-dev@lists.linaro.org>; Wed,  1 Sep 2021 12:09:18 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id b4so3019300ilr.11
 for <greybus-dev@lists.linaro.org>; Wed, 01 Sep 2021 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8cZI3JCuLp/VE4CkVId11EMKSems40tyrkIK1Be1ftw=;
 b=BckSNcvNMOcvSd7v/oDs69GDBnbITTcsGLEeGp8WOKnquld8s9ItFWSEGz5vLrfhcg
 yZT1kbJOOWEFIjzCNC9W2lGpzCSJvssMvpUXf8N+Axb0aahsxStSy8NofhulPdABX4F9
 PQEhQGx63KhfCLo0nqeg29DuVeFqdO7s5JEkA07Vd6pEzuXT2moy4Rt3GMOrs6Ngd9/C
 zbzWY+GPjk3eKj2oGR2aoDlVz1Vm2z7uv2FCN/5IlVFvAXkrHQmXAceheN+crJ+7FscF
 ee0K2dpeSoHlQCOFIfd1+wc2lpL7rGJqsH+uSHL4Lru7Ma5brXDQ+lHnloOjiQ7/jaE2
 QY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8cZI3JCuLp/VE4CkVId11EMKSems40tyrkIK1Be1ftw=;
 b=rQJFvXZWBOvv5eTYAHlv1jnRi1ywxFrfyJv32vaxmmwyigeuKUrU4wHbXhVmYBYE+k
 VUxEgTX7rR4daphqrG+cCNL8R9IKvpnNvAvOtisnXJqu2STvqsevQX+rbXrDivPWrm6A
 +XIOwChZE/1PB0+oiOzi1O+w+jGc3mXuGgLWKUxNYPA3712KDD2sZxE8/GDqoYBEHmvV
 9e/jxlBhjF+8o9vx8KeKZ7rI4j0xk8HhCXn0uAV4JE5fxK1jzSvMQyPGEnlMz0H0nsNp
 y5FCaKDoL72BXP8ONqXfUMDBJoVd3j4cJAbKF/4raAySQ/8hR3qiw27+uXuW3A9SY9y2
 YYtg==
X-Gm-Message-State: AOAM5302qDS8EGlTFgACcMsOBkHSuW0GQqq2RFcdNPk7ddKl8MM4qCfH
 reBollqB341kTp7Zk57Mr0TrvgchwfgKHOqoJY4=
X-Google-Smtp-Source: ABdhPJwbWbqjZ2YXu2DKUD2OmK1e0Bsf5zCBQX/yZA3LIScSzqxAeN61s6ns9w3+r13R/STby73GUg==
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id
 h30mr24434965ila.195.1630498157795; 
 Wed, 01 Sep 2021 05:09:17 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id z7sm12046546ilz.25.2021.09.01.05.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:09:17 -0700 (PDT)
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Johan Hovold <johan@kernel.org>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <f7a25eb1-20f4-5031-a156-9e5dc019ad28@linaro.org>
 <YS3jSsGSs0yAw/Ba@hovoldconsulting.com>
 <6155058.TBsaUTXu4T@localhost.localdomain>
From: Alex Elder <elder@linaro.org>
Message-ID: <794b3ff8-0240-ff14-8721-cdf510f52be3@linaro.org>
Date: Wed, 1 Sep 2021 07:09:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6155058.TBsaUTXu4T@localhost.localdomain>
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
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 8/31/21 6:50 AM, Fabio M. De Francesco wrote:
> I was wrong in assuming that trivial patches to Greybus are welcome as they 
> are for other drivers.

This is not a correct statement.

But as Johan pointed out, even for a trivial patch if you
must understand the consequences of what the change does.
If testing is not possible, you must work extra hard to
ensure your patch is correct.

In the first (or an early) version of your patch I pointed
out a bug.  Later, I suggested
 the lock might not be necessary
and asked you to either confirm
 it was or explain why it was
not, but you didn't do that.


I agree that the change appeared trivial, and even sensible,
but even trivial patches must result in correct code.  And
all patches should have good and complete explanations.

					-Alex
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
