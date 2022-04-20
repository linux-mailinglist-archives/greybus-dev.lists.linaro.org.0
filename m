Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766C508BE4
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 17:15:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5F4BC40489
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 15:15:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 94D5C402CB
	for <greybus-dev@lists.linaro.org>; Wed, 20 Apr 2022 15:15:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F767B81FC2;
	Wed, 20 Apr 2022 15:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD58C385A1;
	Wed, 20 Apr 2022 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650467738;
	bh=s7kJbmHO4oxkSYmU5fDmutKf8GGc1BWHsk8DFVUqsDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRJXGImARYU+HNAm1q0eaA8GkeFhjY2BSnH+foEDcFW9Yyais53+e+7qXju5J55DQ
	 c7V+G0UDQ89k0bBaMxyECji33PIijivPSB30G668zaqFUyu0B9tbuAHPwIRdGhYY9w
	 Hb1NHqdD7rCQdzUFkph4cQLXHV/gCo48lxg3C6rc=
Date: Wed, 20 Apr 2022 17:15:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaehee Park <jhpark1013@gmail.com>
Message-ID: <YmAjliv4DdTY+JvZ@kroah.com>
References: <cover.1649824370.git.jhpark1013@gmail.com>
 <12037ae2502ad7d0311bcdf2178c3d2156293236.1649824370.git.jhpark1013@gmail.com>
 <a4e5c567-63dd-f7de-114b-a357075444a2@ieee.org>
 <20220414200932.GA4147124@jaehee-ThinkPad-X1-Extreme>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414200932.GA4147124@jaehee-ThinkPad-X1-Extreme>
Message-ID-Hash: FXGFXSGADFILS7PFMPNTTMTQIGC62SZG
X-Message-ID-Hash: FXGFXSGADFILS7PFMPNTTMTQIGC62SZG
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/2] staging: greybus: remove empty callback function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FXGFXSGADFILS7PFMPNTTMTQIGC62SZG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 14, 2022 at 04:09:32PM -0400, Jaehee Park wrote:
> On Wed, Apr 13, 2022 at 07:48:03AM -0500, Alex Elder wrote:
> > On 4/12/22 11:38 PM, Jaehee Park wrote:
> > > Remove the optional remove callback for the soc_codec_dev_gbaudio
> > > structure. The only place it is referenced is
> > > snd_soc_component_remove() which is only called if the sound_component
> > > pointer is non-null. The null function pointers here can be optionally
> > > ommitted. When a sound component is registered this way, the remove
> > > callback is optional. We can safely remove the whole gbcodec_remove
> > > function, which used to be an empty function with a void return type.
> > 
> > Now I think your description is a little long...  But that's OK.
> > 
> > This looks good to me.  Thank you for responding to all our
> > feedback.
> > 
> > Reviewed-by: Alex Elder <elder@linaro.org>
> 
> hi Greg, I saw that this was past on to staging-next already. Is it too 
> late to add Alex to the reviewed by? 

Yes, sorry.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
