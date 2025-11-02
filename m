Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD1C28E18
	for <lists+greybus-dev@lfdr.de>; Sun, 02 Nov 2025 12:25:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A5CD63F778
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Nov 2025 11:25:45 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	by lists.linaro.org (Postfix) with ESMTPS id CB9633F778
	for <greybus-dev@lists.linaro.org>; Sun,  2 Nov 2025 11:25:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kroah.com header.s=fm3 header.b=fwI58T5k;
	dkim=pass header.d=messagingengine.com header.s=fm3 header.b=tx54dOdu;
	dmarc=pass (policy=none) header.from=kroah.com;
	spf=pass (lists.linaro.org: domain of greg@kroah.com designates 103.168.172.148 as permitted sender) smtp.mailfrom=greg@kroah.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id A74B4EC02EF;
	Sun,  2 Nov 2025 06:25:41 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 02 Nov 2025 06:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1762082741; x=1762169141; bh=eMgNMqqqsn
	q9Z9xVXUVGiUsUCvTB6a5jHhl12aqMYsY=; b=fwI58T5kC21xw28hnOM2bDBfP9
	i4fhJQiWRL9gmdgsfc1I76B1YN0NvGhj5K3bds0ec9988rtSyLEKfSIxTkQK19hO
	aAZ1//vH8V61T3blxCC7murYstNsQFjGl2wgztbjSRqaieBolPUoba252cg/YwyD
	2DU9cnGdT7k4NCVAPFZmbnOGc0IvrE5Ug/c1lzPBPJfomw4ITP2v6qZoRpa7Wt5l
	IXG1eKzHbQoqot2Xc1hS1TUk3aBVFxvGOxChAkAwNKEr+TymSzVg1/C8f5BEsbFO
	fHVA2QyPiF8YKp+Bl8/qndav2viWBSOzG070eAAVBRebRE5SH6DdJ4fM0j/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762082741; x=1762169141; bh=eMgNMqqqsnq9Z9xVXUVGiUsUCvTB6a5jHhl
	12aqMYsY=; b=tx54dOduKRGVmqPcP1CamcSbZlfGoZfjDTaYVLd/Pt05WLoE9Ds
	TBLJnbCZwPNavtBZugjKW8txjgwmVoy3cqk9yfGf0nuANo1dYDnZ8U2zEdqxR5f5
	Aum/58h2F2jra37bfrXvy39bm3DqSVXK16kqqO94MseZlRXvoXaAln14xszpP3Bn
	NHrJkzKA3QzZtlC4ck90R+2m20eK89p9nfQmCPF23qF/yIfyiBDY2rOCgpDTODdV
	HKbOghY8sd9/lSOI4hYWFeWYh3VWJhuhPQZOuqKZBiA4wJPJwO5bl/3zxI/3t6so
	KnWcnZd83TSVM4XcO1ueIbmDaMj045r0HMQ==
X-ME-Sender: <xms:tT8HaXU_a5ED4WGX0x-iDq2BzaVpMG_pFbC-ln8f0rKrcbseS4NR5w>
    <xme:tT8HaSIDPW4l1jsYpNZd_q5R2GPrk_Fd1bS5kPWpvfsHDUwuBkC0jBNikm4HEUAF_
    jGzidqy58k-RgkM5JRSHDSLye9962AVuCaf584PjWiooLhqMg>
X-ME-Received: <xmr:tT8HaXC2QKeTetomvDHJnxEn2NF16AZ_n5n9PRpK4n7r6HhLkBaxucJ00CKM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeehuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhf
    dtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepvhgrtggrtggrgiduieesghhmrghilhdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehgrhgvhigsuhhsqdguvghvsehlihhsthhsrdhlihhnrghrohdr
    ohhrghdprhgtphhtthhopehvshgvohhkrghkthhushgrhhejsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:tT8HaScDQ7cyA2QizXH-dAySO6kdKKhTPlbGuaomgEWCBvC8HVaNpA>
    <xmx:tT8HaW2R0XdPQIXl9y_ap2zPlJR_hTdrmtR2NPYNBKfDpFwLX3RB7g>
    <xmx:tT8HaZiPAPXgR2GqBf1vJzHTJ0q8GlI8P3Ciwg6Fa34huqvTnneGRA>
    <xmx:tT8HafmvZsssvm0bMnWq3OaOoL9k2Awhzp4npjITxOdn8WIjmxr0hg>
    <xmx:tT8HaTIqTDsasSZwnCsrwdGK5VjmDUn8kFa27q7JOgLi9NPeGUCN4EPO>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 06:25:40 -0500 (EST)
Date: Sun, 2 Nov 2025 20:25:36 +0900
From: Greg KH <greg@kroah.com>
To: zntsproj <vacacax16@gmail.com>
Message-ID: <2025110200-announcer-handful-fc5d@gregkh>
References: <20251101075247.11415-1-vseokaktusah7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251101075247.11415-1-vseokaktusah7@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CB9633F778
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:103.168.172.128/27];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:151847, ipnet:103.168.172.0/24, country:AU];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[kroah.com:dkim,messagingengine.com:dkim];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linaro.org,gmail.com];
	URIBL_BLOCKED(0.00)[linaro.org:email];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[103.168.172.148:from];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: HFSSIVGNWOWZSOBIFM2VDRNK5GL3XPR7
X-Message-ID-Hash: HFSSIVGNWOWZSOBIFM2VDRNK5GL3XPR7
X-MailFrom: greg@kroah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, zntsproj <vseokaktusah7@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] Fix tiny typo in firmware-management docs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HFSSIVGNWOWZSOBIFM2VDRNK5GL3XPR7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 01, 2025 at 10:52:47AM +0300, zntsproj wrote:
> Signed-off-by: zntsproj <vseokaktusah7@gmail.com>
> ---
>  .../staging/greybus/Documentation/firmware/firmware-management  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware-management b/drivers/staging/greybus/Documentation/firmware/firmware-management
> index 7918257e5..393455557 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware-management
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware-management
> @@ -193,7 +193,7 @@ Identifying the Character Device
>  
>  There can be multiple devices present in /dev/ directory with name
>  gb-authenticate-N and user first needs to identify the character device used for
> -authentication a of particular interface.
> +authentication of a particular interface.
>  
>  The Authentication core creates a device of class 'gb_authenticate', which shall
>  be used by the user to identify the right character device for it. The class
> -- 
> 2.51.2
> 
> _______________________________________________
> greybus-dev mailing list -- greybus-dev@lists.linaro.org
> To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for a
  description of how to do this so that Greg has a chance to apply these
  correctly.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
