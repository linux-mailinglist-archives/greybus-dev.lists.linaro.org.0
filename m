Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D979949DEB4
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 11:05:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14089401D7
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 10:05:29 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	by lists.linaro.org (Postfix) with ESMTPS id AB8243ECC6
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 10:05:25 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id nn16-20020a17090b38d000b001b56b2bce31so2426273pjb.3
        for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 02:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LBOQjqTrRKyhdvBvzMylROfqbjWsRkHJwbCc+XSqEB4=;
        b=hU+y8UUCtnvmLs91gy6C7O0CCHoYJ2TYmaHx7LExtXnAX3g2ZUWGqWjQGO9/EoDTHL
         LKJm5G2IXBdaabWdTa5DJp52fycGA3iBYSheTFsR6/eT0zTGBJ9vL1CUM+YzZJ4QOml5
         mjaQGcvCY2aRk+2I7XMu+2PSCwnYj1z7fGDwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LBOQjqTrRKyhdvBvzMylROfqbjWsRkHJwbCc+XSqEB4=;
        b=bh2OFHoUTJzBN887wh/VLOp7AdXkpKlUzxH++YsRx215CTjgZsAhaenZy6ThR0r/TT
         DaQCiWsjQBO/qLJv9sFC0RG3uiUm7Urvb5xkRJ/RVgzLi895TupjYWWbU1Wq8krIRkjQ
         ARbUFGPrL2tMjf+BWlswseuGi18JCV75dmJV/WolvrQ7horlNgV37tvebgQ+G6edcTzX
         lFGY9avpXrwaifDHBbbJbGj0CK/gCkfeb6wUGzNDu1UzyJZ79g5GTRNUuqaVTD8n0VQB
         z9Wp+gdpdcN3d69Vh5JduSPcw41LdlPpaAFO/vNo771mXBToCEUO/4I2AAYQvS+bhsyD
         Dr6A==
X-Gm-Message-State: AOAM530jibJ3wok1bKaBYRAoRB5wqQzjX8VA6jatSjvJ8PdVACCR0lC/
	L7zBEoiLKoosbljtnt86d1FqFg==
X-Google-Smtp-Source: ABdhPJwHB0qa1O7m8UjQXGx1IEj/br7glW0Yig/xNOufSEf8geSAYNnvEm+sDvMzb7zRtZzMRbp7zw==
X-Received: by 2002:a17:90b:1b46:: with SMTP id nv6mr3459486pjb.178.1643277924815;
        Thu, 27 Jan 2022 02:05:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p42sm4980243pfw.71.2022.01.27.02.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:05:24 -0800 (PST)
Date: Thu, 27 Jan 2022 02:05:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <202201270204.D460EC35@keescook>
References: <20220121222250.GA73021@embeddedor>
 <202201241213.82E7D9F598@keescook>
 <20220126105404.GY1951@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126105404.GY1951@kadam>
Message-ID-Hash: 3CD3MY3NJP6DIN3ONEA2OIAWA4OL2ZHR
X-Message-ID-Hash: 3CD3MY3NJP6DIN3ONEA2OIAWA4OL2ZHR
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] staging: greybus: i2c: Use struct_size() helper in gb_i2c_operation_create()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3CD3MY3NJP6DIN3ONEA2OIAWA4OL2ZHR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 26, 2022 at 01:54:04PM +0300, Dan Carpenter wrote:
> On Mon, Jan 24, 2022 at 12:19:03PM -0800, Kees Cook wrote:
> > This could still overflow if struct_size() returns SIZE_MAX. Perhaps:
> > 
> > 	if (check_add_overflow(struct_size(request, ops, msg_count),
> > 			       data_out_size, &request_size))
> > 		request_size = SIZE_MAX;
> > 
> > I should brush off the saturating arithmetic helpers series:
> > https://lore.kernel.org/all/20210920180853.1825195-1-keescook@chromium.org/
> 
> Yes, please!  Those seem like a million times easier to use.

Here they are! :) Please review:

https://lore.kernel.org/lkml/20220124232342.3113350-1-keescook@chromium.org/

Thanks!

-- 
Kees Cook
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
