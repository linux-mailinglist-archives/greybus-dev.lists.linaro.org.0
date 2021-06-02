Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB82398D35
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 16:37:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D5DF60F06
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Jun 2021 14:37:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8522E60FFB; Wed,  2 Jun 2021 14:37:30 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3FAA60774;
	Wed,  2 Jun 2021 14:37:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 050D260694
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:37:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EDCA760752; Wed,  2 Jun 2021 14:37:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id D27F660694
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 14:37:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61A36610E5;
 Wed,  2 Jun 2021 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622644643;
 bh=Ba1fJoC8PHQZgu+PPULsYm/Lb98b/hJDzMf9rPIQPf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pNH2h+AN+6BEc/BuTwAg7ebeGDvP1IzS8/dwuw9WyemvRqLXvrO0rboW3BeYOrCRC
 A0x5ap3FiVFLypJl7Z3pkI+c8vsDBR15UziGnletDfGVJlZSHWbbUV8G55lfj/Egog
 Le3d3nYED4XwoCN9rIhgixCubhSJ5GUl5dTJGTGI=
Date: Wed, 2 Jun 2021 16:37:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Message-ID: <YLeXoQH2/iJjxkc+@kroah.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
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
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Jun 02, 2021 at 07:57:35PM +0530, Manikishan Ghantasala wrote:
> Sending this mail again as I missed to reply to all.
>  Hi Alex,
> 
> I agree those are called bit-field member names rather than labels.
> But the reason I mentioned is because the ./scripts/checkpatch.pl
> gave out a warning saying "labels should not be indented".

checkpatch is a perl script that does it's best, but does not always get
it right.  In this case, it is incorrect, the existing code is just
fine.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
