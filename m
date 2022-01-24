Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B335499378
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Jan 2022 21:36:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C0E8A401C6
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Jan 2022 20:36:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id E72343ECC4
	for <greybus-dev@lists.linaro.org>; Mon, 24 Jan 2022 20:36:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C56161535;
	Mon, 24 Jan 2022 20:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15638C340E7;
	Mon, 24 Jan 2022 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643056569;
	bh=N6HkrGlOPhp/lfQrBU6OuWeAmsz4cFxje4P56uyHS08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMvS0u9vqPHiJmamtWo2hxIfeAM+s7Ecv0ZmZJ0nQZ3D9W1YwYkePQzqZdW43jJC/
	 pfn1HewwRr0fGJ+xwd5Szt17yDi6vy2vdgPuuIuDHKlaCZuIULmPqLbZn9cVnX2nzn
	 AtH4RV7t+kJEaz7frVA2Aebsq/f/78dU+4jAly/NqVY6WvAUtuMyruYuYh2yF/EwF4
	 nhXr1MwoYKa6iexDzDGY+fGXeEWHH1cVD03wqebpbpxEwrgzZAcxu4mUZBDTrdMb4K
	 albBIx6R0f/tPjsk7yittG9m7wqN75cGDYd3L2DxSO/JotyKF7DmJsKKXj/81iMtvq
	 fD0RpJx+KWiuQ==
Date: Mon, 24 Jan 2022 14:42:53 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20220124204253.GA11735@embeddedor>
References: <20220121222250.GA73021@embeddedor>
 <202201241213.82E7D9F598@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202201241213.82E7D9F598@keescook>
Message-ID-Hash: ZXV2JR4YGCUXTZKSM5PYGTNEBJGKGF7X
X-Message-ID-Hash: ZXV2JR4YGCUXTZKSM5PYGTNEBJGKGF7X
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] staging: greybus: i2c: Use struct_size() helper in gb_i2c_operation_create()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZXV2JR4YGCUXTZKSM5PYGTNEBJGKGF7X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 24, 2022 at 12:19:03PM -0800, Kees Cook wrote:
> On Fri, Jan 21, 2022 at 04:22:50PM -0600, Gustavo A. R. Silva wrote:
> > Make use of the struct_size() helper instead of an open-coded version,
> > in order to avoid any potential type mistakes or integer overflows that,
> > in the worst scenario, could lead to heap overflows.
> > 
> > Also, address the following sparse warnings:
> > drivers/staging/greybus/i2c.c:111:24: warning: using sizeof on a flexible structure
> > 
> > Link: https://github.com/KSPP/linux/issues/174
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/staging/greybus/i2c.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> > index de2f6516da09..9dfc6791c20e 100644
> > --- a/drivers/staging/greybus/i2c.c
> > +++ b/drivers/staging/greybus/i2c.c
> > @@ -108,9 +108,7 @@ gb_i2c_operation_create(struct gb_connection *connection,
> >  		else
> >  			data_out_size += (u32)msg->len;
> >  
> > -	request_size = sizeof(*request);
> > -	request_size += msg_count * sizeof(*op);
> > -	request_size += data_out_size;
> > +	request_size = struct_size(request, ops, msg_count) + data_out_size;
> 
> This could still overflow if struct_size() returns SIZE_MAX. Perhaps:

uggh... I got too excited with all the new cases reported. 
> 
> 	if (check_add_overflow(struct_size(request, ops, msg_count),
> 			       data_out_size, &request_size))
> 		request_size = SIZE_MAX;

Yep; I'll respin and include this change, thanks!
> 
> I should brush off the saturating arithmetic helpers series:
> https://lore.kernel.org/all/20210920180853.1825195-1-keescook@chromium.org/

Yeah; those helpers are very much needed in many places we need to audit...

--
Gustavo
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
