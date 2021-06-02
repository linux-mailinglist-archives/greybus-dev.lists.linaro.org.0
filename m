Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C9399A71
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DCCAF610D0
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D3F6961014; Thu,  3 Jun 2021 06:03:28 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1B78A61009;
	Thu,  3 Jun 2021 06:03:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C137260713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:40:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BF12560774; Wed,  2 Jun 2021 14:40:15 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by lists.linaro.org (Postfix) with ESMTPS id B8DCE60713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:40:13 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id a21so2878042oiw.3
 for <greybus-dev@lists.linaro.org>; Wed, 02 Jun 2021 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RWVAxqbt2ragLnej0S2guhkFqxl9f5X2TG9vofPgr5g=;
 b=pIK5I0OJGNcUZKY6fYRPbWFjK/lbB/dhyRXSbbm+CTTMFSRjrlWjvL5G5XGfbhX3K6
 CGKXNujPs93Tr1f+duXmLRro7Rtvvd3PeoeSAXXamUOCFow3NZdJtOCk5nQkQ2yerRhJ
 lAX7VU/YBPjMjMeh1RioPTnUaliC6N+lg0eaH0xWmF9VxYspJTWHZjWx1kX9HAPNSlMQ
 33kL5izgAkE9rx0Rp6qUuU8yFyE8JEVfvqBSI5MjHgAdwniQ7cKoSUlr/71XclJ92/G3
 A13Bxker1PmlMbws/jkuzEZs0rumjVtvDPb5kh1183ZsbwmdsA971Gu2+kYYPbWqqoes
 5fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWVAxqbt2ragLnej0S2guhkFqxl9f5X2TG9vofPgr5g=;
 b=qwZiRdxexYpVIYGtOZmJPm6qav9saR4YcG3UIq/XaF+nBqmkHHeZz6gdjez3noleTM
 nLdUnKtyT+NhZ86xgks3qrXSLklofMeCbZ+8jnlW2lpuP8I84xq+dDyw2tmzk2kDB/tI
 cG4TzkSQ++bhQK7ndb9+sKMKkRPROWnwGifuNbfkNqd8MfBkMyN5/VlJemAVMbcLeNq5
 g7bESW1JIA7qiBYY6X9eD8IfVLDow2tQ9qehDz9mnH+YI1AG9l0GrMAg+QQcLNQbYiKZ
 nJH0yVLiqIUy2kd2pOibFHXoGvNIY1eCy0dshJzK+CQhueKpcksE/PuxOhY9ax5LX0VF
 WzyQ==
X-Gm-Message-State: AOAM533tCFtOfWtG4jmkcXtESiyzAvuHZiVdgABfICZ9XYeh8Tl25gUV
 4z46ZXMnSiHhlaen/wA2OOUQEVwt7gfmU1KOUOw=
X-Google-Smtp-Source: ABdhPJw9W8YmUacJHRTLRKCSRcE6AT1Zu3kRNDtCEpiYsKWDEmet6F863hn0P5W2iDFQ+YX04vhuiOFjMdEZ014wjcU=
X-Received: by 2002:a05:6808:244:: with SMTP id
 m4mr3971937oie.37.1622644813198; 
 Wed, 02 Jun 2021 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
 <YLeXoQH2/iJjxkc+@kroah.com>
In-Reply-To: <YLeXoQH2/iJjxkc+@kroah.com>
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Date: Wed, 2 Jun 2021 20:09:27 +0530
Message-ID: <CAKzJ-FPZeM1QettgDyNaXy4xXpXX0YVm1TNVaKHOopiYevALjA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
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
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Hi Greg,
Thanks for the clarification.
Regards,
Manikishan Ghantasala

On Wed, 2 Jun 2021 at 20:07, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 02, 2021 at 07:57:35PM +0530, Manikishan Ghantasala wrote:
> > Sending this mail again as I missed to reply to all.
> >  Hi Alex,
> >
> > I agree those are called bit-field member names rather than labels.
> > But the reason I mentioned is because the ./scripts/checkpatch.pl
> > gave out a warning saying "labels should not be indented".
>
> checkpatch is a perl script that does it's best, but does not always get
> it right.  In this case, it is incorrect, the existing code is just
> fine.
>
> thanks,
>
> greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
