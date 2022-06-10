Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F025468DE
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 16:56:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6DC033F4D2
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 14:56:18 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lists.linaro.org (Postfix) with ESMTPS id 8F4B03F192
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jun 2022 14:56:15 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i64so502657pfc.8
        for <greybus-dev@lists.linaro.org>; Fri, 10 Jun 2022 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wJsCFQid4sHaK/ZKO+qfx/hNEBYaCAv7ipedUinRSCA=;
        b=DmZwOB8yj183zZJrZAw1WK2vDFaNRohRqhiAivoZuMpBDx4rD75d9vSgogfoFOXTyA
         oNOqJux67XmaerADpU2/fXwgugw/2QujGD062CGuRuRWOHGriavWeAyfSmRPjsXYrExA
         3ktfE5K0SpyCx0x6WGvPki69v5wXWD2uEOYcLQXQ51qO1U6JAnvQUQyj5AVtLTsHfTcC
         f0jjVb1O6MdrNnIDy2U1MtQ2xH+PfAOOU8byi6x2hmh1BfIFhx/OiVle9E1mT1zYBVEK
         1ENBT1mwGJGRuiXSs5mRkHP6HEpH1/etrfnSjTlbECIay3MuEXfJUH9ooLD0ctao/0+y
         I3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wJsCFQid4sHaK/ZKO+qfx/hNEBYaCAv7ipedUinRSCA=;
        b=ZJRluc5wPBlNbqNgVatubvLL4nVV6Dely5DV9r/QrYtB7mHfGdCuenFODOGqX4S4Qs
         PHG/HmOWUlYWuXYpy3AhbuM4vBwcUr4e+oeqNEIInPEFuLWVhGD5Nr62VAL+m/m1wrTU
         LE3KgLQk4KA+za7SOEFClqHuEEhFmvJL0o6BqAochwvvkZJRCbeWvUPSVw5Wn+nb6j2n
         QlqcV9Exj+v8sEMgcdgJxyYwkUfOVT2xdLo5EWHHrMhgTgHIVfElzYYpc/dj05QMP4io
         w7c6a/9zFhbe4qLIGEbxvWwk5i4xxz/68W/mVAAiGiSODSDXbYVj4C8pxdnZp9LoNznZ
         T1gw==
X-Gm-Message-State: AOAM533kZc61PFEcthStOUr4NRO4LGFCR8thVP2vL5tshc5ttCVNyz3L
	mvygjcAaa2zGT6tVVgyNGFg=
X-Google-Smtp-Source: ABdhPJxBbi7wAzOxsxQJx2yKTE9EOjkYyRVB0nQ0HCXHa7+Kx6P3rlnHpDEIDoMVIAbd0oJoRk2/sw==
X-Received: by 2002:a05:6a00:148f:b0:51c:70f9:b62e with SMTP id v15-20020a056a00148f00b0051c70f9b62emr13426346pfu.84.1654872974762;
        Fri, 10 Jun 2022 07:56:14 -0700 (PDT)
Received: from fedora ([2601:1c1:4202:28a0::ec2b])
        by smtp.gmail.com with ESMTPSA id x17-20020a056a000bd100b0051be1b4cfb5sm15393657pfu.5.2022.06.10.07.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 07:56:14 -0700 (PDT)
Date: Fri, 10 Jun 2022 07:56:12 -0700
From: Jared Kangas <kangas.jd@gmail.com>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YqNbjINDaEBZktbS@fedora>
References: <20220609214517.85661-1-kangas.jd@gmail.com>
 <YqL6A3pVC8LOqE4d@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqL6A3pVC8LOqE4d@hovoldconsulting.com>
Message-ID-Hash: KKPRF3E7V3N6SSMJYTBAHEICWNH6N7J7
X-Message-ID-Hash: KKPRF3E7V3N6SSMJYTBAHEICWNH6N7J7
X-MailFrom: kangas.jd@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-staging@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KKPRF3E7V3N6SSMJYTBAHEICWNH6N7J7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 10, 2022 at 10:00:03AM +0200, Johan Hovold wrote:
> On Thu, Jun 09, 2022 at 02:45:18PM -0700, Jared Kangas wrote:
> > gbaudio_dapm_free_controls() iterates over widgets using the
> > list_for_each_entry*() family of macros from <linux/list.h>, which
> > leaves the loop cursor pointing to a meaningless structure if it
> > completes a traversal of the list. The cursor was set to NULL at the end
> > of the loop body, but would be overwritten by the final loop cursor
> > update.
> > 
> > Because of this behavior, the widget could be non-null after the loop
> > even if the widget wasn't found, and the cleanup logic would treat the
> > pointer as a valid widget to free.
> > 
> > To fix this, introduce a temporary variable to act as the loop cursor
> > and copy it to a variable that can be accessed after the loop finishes.
> > Due to not removing any list elements, use list_for_each_entry() instead
> > of list_for_each_entry_safe() in the revised loop.
> > 
> > This was detected with the help of Coccinelle.
> > 
> > Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Johan Hovold <johan@kernel.org>
> > Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
> > ---
> > 
> > Changes since v1:
> >  * Removed safe list iteration as suggested by Johan Hovold <johan@kernel.org>
> >  * Updated patch changelog to explain the list iteration change
> >  * Added tags to changelog based on feedback (Cc:, Fixes:, Reviewed-by:)
> 
> Apparently Greg applied this to staging-next before we had a change to
> look at it. You should have received a notification from Greg when he
> did so.
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=80c968a04a381dc0e690960c60ffd6b6aee7e157
> 
> It seems unlikely that this would cause any issues in real life, but
> there's still a chance it will be picked up by the stable team despite
> the lack of a CC stable tag.
> 
> I've just sent a follow-up patch to replace the list macro.
> 
> Johan

Sorry about that - I got a notification but thought it was still
revisable. In hindsight, it makes sense that once it gets applied to
a public branch, changes should be done in additional patches. Thanks to
both you and Dan for taking the time to review and catch my mistakes.

Jared
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
