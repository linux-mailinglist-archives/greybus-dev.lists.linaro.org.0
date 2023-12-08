Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 638FA809E0B
	for <lists+greybus-dev@lfdr.de>; Fri,  8 Dec 2023 09:22:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5177940436
	for <lists+greybus-dev@lfdr.de>; Fri,  8 Dec 2023 08:22:18 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id 0995A3EF7C
	for <greybus-dev@lists.linaro.org>; Fri,  8 Dec 2023 08:22:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=fbbosnOk;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d06819a9cbso13865365ad.1
        for <greybus-dev@lists.linaro.org>; Fri, 08 Dec 2023 00:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702023731; x=1702628531; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZB3VLtXDWaSMaOTo1FiSlMXHqm5+b+9a5ub3BO89z4=;
        b=fbbosnOkoaV1hj7Ia64IqRrbToVqbsSCDIC4fiX49dKdKwi/Efg6HrLvFaUZ+mJA53
         HknI+ZWkewA0w/7TolDoQH8wYMFWGXh8cUDCr1Jb7f3w75YRrPJuI2MLU1iGSpy0wXZ5
         YhnuJsW9CGGqx8a01Jls6jx99tImzTOrSwJ1jq0DYhjkVsZhjxYV2+ZRoxAQNxJSJsHb
         x6uGXzQR8NsPltcjr35dP2LDTOPp2Z5pYGQjJGv/iCcgwaJev74cuAJaozDYsOQ0msxH
         H1zLDuN5KO3tYhROpQmWe86l9MP7WXUddtjBLLo8BFOI1IWGQYDIG29cKRE8YfpEoe4x
         q16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702023731; x=1702628531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZB3VLtXDWaSMaOTo1FiSlMXHqm5+b+9a5ub3BO89z4=;
        b=cz2TRYxvHF8PA3zy2tqrF+6W1KimqTs2nlkostC1L9QjwO4zWaG4TNMbJvzWd+AAQ6
         YL/BA6UtlfhI7dtWs22iv/hEAhNBTWeUKdrOqBNTBcPLi9skXvEBTqugW1iXZfcDe/h0
         HKv4ybV2liTsbdr4PJu29pXUskJcV47zdIFt6ShyyODwbOXSr/cJTu5SWBFjHAuEw60t
         1QZ48JzWOQOksJGR5qrsammTrNhc45hgzi67z7g0CXrwFU5W4x3hfWkPEGkpEQMfmGkP
         ZnzgWSdnS0dUAaTlTY5CWvqVsksteyb8Lq5YhJflsR6a1MQyX38xYz+SjGMgXMi1ph4A
         8xFA==
X-Gm-Message-State: AOJu0Yynpv7CRLlz7y7bvvVn7l9vX3ZkPbDcFMwnHJPNKrfrnPKxfS94
	WAeB1H8o2I3ZHWra7dafUtc=
X-Google-Smtp-Source: AGHT+IEwgodN/a4UP4l22QNrk4yK0Y694N+zXeDF+v/G+X6i33chicM7XZMRBGXU485HiB36yI/mtA==
X-Received: by 2002:a17:902:d2c1:b0:1ce:5b93:1596 with SMTP id n1-20020a170902d2c100b001ce5b931596mr4099361plc.5.1702023730976;
        Fri, 08 Dec 2023 00:22:10 -0800 (PST)
Received: from ?IPV6:2401:4900:5aa5:8033:d346:47e3:6a7f:374d? ([2401:4900:5aa5:8033:d346:47e3:6a7f:374d])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902ea0e00b001c88f77a156sm1094407plg.153.2023.12.08.00.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 00:22:10 -0800 (PST)
Message-ID: <6cfbd32b-beb5-49b7-8116-cf95e11586b3@gmail.com>
Date: Fri, 8 Dec 2023 13:52:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20231206150602.176574-1-ayushdevel1325@gmail.com>
 <20231206150602.176574-2-ayushdevel1325@gmail.com>
 <2023120758-coleslaw-unstopped-530c@gregkh>
 <c0823649-8235-40d7-813e-8a4500251219@gmail.com>
 <2023120805-endocrine-conflict-b1ff@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023120805-endocrine-conflict-b1ff@gregkh>
X-Rspamd-Queue-Id: 0995A3EF7C
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.178:from];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: LBWFAW6OBIOTZL2MOSM6O4QZZBAKCU2Y
X-Message-ID-Hash: LBWFAW6OBIOTZL2MOSM6O4QZZBAKCU2Y
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LBWFAW6OBIOTZL2MOSM6O4QZZBAKCU2Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 12/8/23 11:03, Greg KH wrote:

> On Thu, Dec 07, 2023 at 10:33:54PM +0530, Ayush Singh wrote:
>>>> + *
>>>> + * @cport: cport id
>>>> + * @hdr: greybus operation header
>>>> + * @payload: greybus message payload
>>>> + */
>>>> +struct hdlc_greybus_frame {
>>>> +	__le16 cport;
>>>> +	struct gb_operation_msg_hdr hdr;
>>>> +	u8 payload[];
>>>> +} __packed;
>>>> +
>>>>    static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>>>>    {
>>>> -	u16 cport_id;
>>>> -	struct gb_operation_msg_hdr *hdr = (struct gb_operation_msg_hdr *)buf;
>>>> +	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
>>>> +	u16 cport_id = le16_to_cpu(gb_frame->cport);
>>>> -	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
>>>> +	/* Ensure that the greybus message is valid */
>>>> +	if (le16_to_cpu(gb_frame->hdr.size) > len - sizeof(cport_id)) {
>>>> +		dev_warn_ratelimited(&bg->sd->dev, "Invalid/Incomplete greybus message");
>>> Don't spam the kernel log for corrupted data on the line, that would be
>>> a mess.  Use a tracepoint?
>>>
>>>> +		return;
>>>> +	}
>>>>    	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
>>>> -		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
>>>> +		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);
>>> Better yet, put the error in the debug message?
>> Shouldn't corrupt data be a warning rather than debug message, since it
>> indicates something wrong with the transport?
> Do you want messages like that spamming the kernel log all the time if a
> network connection is corrupted?
>
> Just handle the error and let the upper layers deal with it when the
> problem is eventually reported to userspace, that's all that is needed.

Ok

>>>> -	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
>>>> +	greybus_data_rcvd(bg->gb_hd, cport_id, &buf[sizeof(cport_id)],
>>> Fun with pointer math.  This feels really fragile, why not just point to
>>> the field instead?
>> It seems that taking address of members of packed structures is not valid.
> That feels really odd.
>
>> I get the `address-of-packed-member` warnings. Is it fine to ignore
>> those in kernel?
> What error exactly are you getting?  Packed or not does not mean
> anything to the address of a member.  If it does, perhaps you are doing
> something wrong as you are really doing the same thing here, right?
> Don't ignore the warning by open-coding it.

So, the error I was getting was `taking address of packed member of 
'gb_frame' may result in an unaligned pointer value`. I can no longer 
reproduce the warning, though. I think I accidentally fixed the reason 
somewhere along the line.

>>>>    }
>>>>    static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
>>>> @@ -339,7 +357,7 @@ static struct serdev_device_ops gb_beagleplay_ops = {
>>>>    static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
>>>>    {
>>>>    	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
>>>> -	struct hdlc_payload payloads[2];
>>>> +	struct hdlc_payload payloads[3];
>>> why 3?
>>>
>>> It's ok to put this on the stack?
>> Well, the HDLC payload is just to store the length of the payload along with
>> a pointer to its data. (kind of emulate a fat pointer). The reason for doing
>> it this way is to avoid having to create a temp buffer for each message when
>> sending data over UART (which was done in the initial version of the
>> driver).
> Be careful, are you SURE you are allowed to send stack-allocated data?
> I know that many busses forbid this (like USB).  So please check to be
> sure that this is ok to do, and that these are not huge structures that
> you are putting on the very-limited kernel-stack.

Well, the greybus operation header and greybus message are not on the 
stack (as far as I know, since they are inputs to the function). The 
memory that is stack allocated for hdlc_payload array is `3 * 
(sizeof(u16) + sizeof(void *))`, i.e. 30 bytes for 64 bit pointers 
(ignoring any padding). So I don't think the size of hdlc_payload array 
should be an issue.

The function `hdlc_tx_frames(bg, ADDRESS_GREYBUS, 0x03, payloads, 3);` 
actually copies the data to a different circ_buf, which is sent later by 
workqueue. So the final data sent is not stack allocated. In fact, none 
of the data from this function is going to be referenced after the call 
to `hdlc_tx_frames`.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
