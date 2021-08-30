Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8AA3FB6D0
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 15:16:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5850061019
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 13:16:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2E68F62175; Mon, 30 Aug 2021 13:16:42 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D311A60A66;
	Mon, 30 Aug 2021 13:16:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 06E5660501
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 13:16:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F0D686073C; Mon, 30 Aug 2021 13:16:38 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by lists.linaro.org (Postfix) with ESMTPS id E63B960501
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 13:16:36 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id u3so30972962ejz.1
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/eOxZaKGbxmQPslyu0PUS3U6D6ydLmM18aPAdUZtRfg=;
 b=sTIEy6k8cD913yMcDMqoAFe5WNTGIfMnlYr8X/PTgSqIj6c/tNIL6vrOU09WJKVswx
 1ZtBeifn8OwF8QhNY+xSrp8B4YTpqBsqNsRqbFyOUQcU4oMevQhf1qGmapsVIMmA4CKK
 RGmu4XGbSK7hKRdnE4JgdxTJY0XR3AsfAGANWDdSSIW0OWxt8OiUXQpgGxGQwZdSx70s
 V9HV7MrJ6thZPJ7sGk19T5tFJfLPwt8vHgWtY/Ov/r4thO/9y3MnUloDFB44g35YgTgW
 JPDkNLfk/NazLkV4R37H+7WzKvgQEhaoa1gztCgzOKW6ZaC+MVvvaWyq94DoxwKWbjkp
 cIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/eOxZaKGbxmQPslyu0PUS3U6D6ydLmM18aPAdUZtRfg=;
 b=gTSiv2p3/w/rm2gJkixm9CeRYtrvP/vUOxIZiGfN2IrSiX5WdWj30Y4PCI2qoWWeNN
 pKw3sjNYYetNevGC3M4A1Ip3EVaMlg4myKd+Xkp63B80WLfDwrrFPB7laVNfSiFPTPDm
 LNPyl2h7j2eP1vzGu6HvlPCwzOTK7paHEoRydNZQa5z0QZgAJOPpayQAgmXMMOY4Ymut
 DtQzxIMrcM7nVeB4xMIc+kzgKg9IElnenuO7Py8wXOYO3ZkYifPOgz6wwbNlwi4QLBIF
 K9zkhLM1STMwEWs9ap+z12xIsc9G9jgeansZKUdQK9voL+PUySScjyKmjEsCyP4lV0Qr
 gI/Q==
X-Gm-Message-State: AOAM530pf2y/mh+TODG1q9GqEMyliyztqOMOLaHdxMYqgMYXPxf9nwwC
 mYDQJ693CL+c+1pjEf4dhU0=
X-Google-Smtp-Source: ABdhPJytTcwVMr733sqiiEbX4zDzTCRG13Mvo74nIsaQQkLOzLbES03gpI0dRHwbWSC9rq4nGAOCTQ==
X-Received: by 2002:a17:906:84d0:: with SMTP id
 f16mr24621579ejy.6.1630329395850; 
 Mon, 30 Aug 2021 06:16:35 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
 by smtp.gmail.com with ESMTPSA id am3sm6699130ejc.74.2021.08.30.06.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 06:16:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 30 Aug 2021 15:16:33 +0200
Message-ID: <8412914.CfCsZqXv9W@localhost.localdomain>
In-Reply-To: <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSzMB80NOkNvdjy1@casper.infradead.org>
 <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
MIME-Version: 1.0
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
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Monday, August 30, 2021 2:33:05 PM CEST Johan Hovold wrote:
> On Mon, Aug 30, 2021 at 01:16:07PM +0100, Matthew Wilcox wrote:
> > On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
> > > Whether the API is better is debatable. As I said, almost no drivers use
> > > the new XArray interface, and perhaps partly because the new interface
> > > isn't as intuitive as has been claimed (e.g. xa_load() instead of
> > > ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
> > > I know.
> > 
> > I can't just slap a 'deprecated' attribute on it.  That'll cause a
> > storm of warnings.  What would you suggest I do to warn people that
> > this interface is deprecated and I would like to remove it?
> 
> I'd at least expect a suggestion in the IDR documentation to consider
> using XArray instead.
> 
> > Why do you think that idr_find() is more intuitive than xa_load()?
> > The 'find' verb means that you search for something.  But it doesn't
> > search for anything; it just returns the pointer at that index.
> > 'find' should return the next non-NULL pointer at-or-above a given
> > index.
> 
> We're looking up a minor number which may or may not exist. "Find" (or
> "lookup" or "search") seems to describe this much better than "load"
> (even if that may better reflect the implementation of XArray).
> 
> And no, I would not expect a find implementation to return the next
> entry if the requested entry does not exist (and neither does idr_find()
> or radix_tree_lookup()).
> 
> Johan
> 
Dear Johan,

Since your are not interested to this changes there's no need to restore the
Mutexes that were in v1. Please drop the patch and sorry for the noise.

Regards,

Fabio




_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
