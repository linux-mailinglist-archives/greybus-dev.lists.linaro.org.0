Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BE230808E27
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Dec 2023 18:04:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BAA8B440FF
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Dec 2023 17:04:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 565C23EFBD
	for <greybus-dev@lists.linaro.org>; Thu,  7 Dec 2023 17:04:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="PjsUnlU/";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cf7a8ab047so8467015ad.1
        for <greybus-dev@lists.linaro.org>; Thu, 07 Dec 2023 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701968642; x=1702573442; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZIcA+9fYzbWnjyGk0GXW0XBB7BmRVEDpCB5UggeUuI=;
        b=PjsUnlU/Z3hmolFohkhXnA0UN88GJ/hIXDb7oOVFdhy1TvJyAZQWZawe/H0sBrIybM
         qmdsS9jNt1GEk3OkFJhrtrPO9MDok1Ug9/5KhDL7uW88TkWD91hGjKXLgKlWkXznvW4E
         32eENYk98hZQEaI2nlxfVPkSClwVVBSVeVYpPg4simf2VQumdfqYZmP/tyIUwOOtmYme
         ycyQvAQBe29Tlurm6eay2stBRhx8NhSZiZyx0HoWwJKqzvHloaVKc7kjlRfTuPuEc/q4
         oYc40XJfUCOusJpOi5mg1ay/SRC8ycqE73EIg0INOz5d1v+ZuXLFT4UxDuW0gHX7XoRb
         foaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701968642; x=1702573442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZIcA+9fYzbWnjyGk0GXW0XBB7BmRVEDpCB5UggeUuI=;
        b=kyAccjWgCkmKzBCKzkwju4OKRkaunZsCTeNrFKrZnZ0j0BTyCIgmYV3UU0UmJmdK99
         /+6AQ5feqnbgSqA6HQllqYB0llc29lXMJEv/8oEyhWrDoYcJEIjlKQ6GNH9UFWYRzKye
         tW/Wpw5LC/EdCQbSiJPbhF6aehAcDQYAvONG9r27uzHTkbjZk3dopdw1Yhn0ZbgTAghd
         wKIFMA+4Tf4TxSw3ndiboYkA7zIitgKZ6BdTLItBG4ILiVbpo69/9yewXHl2+AfSF0GZ
         YFTOt7yYdPVGhrFm4zJCAn9lP7N658rwyO6G7a2qE3o6VjJh+BiUeXnKK3JZ3BgLJRkr
         zSQg==
X-Gm-Message-State: AOJu0Yz1H9PrjdoXfhMp4lZVSOUCu/rg97gkD6BUkbZwvDJXV/6BsU5E
	ukRHWHW6k6sHxShpH0UYNVA=
X-Google-Smtp-Source: AGHT+IF1L6MNer4FwLYISwW1U2aCJzS0INHs6Pte/IsYAV0smcVX4K3EDVYM2WEzhgt7VgLKEv/wOw==
X-Received: by 2002:a17:902:6bc5:b0:1d0:6ffd:8354 with SMTP id m5-20020a1709026bc500b001d06ffd8354mr2076131plt.95.1701968642031;
        Thu, 07 Dec 2023 09:04:02 -0800 (PST)
Received: from ?IPV6:2401:4900:51d9:562a:9ec:cd8:a919:e33f? ([2401:4900:51d9:562a:9ec:cd8:a919:e33f])
        by smtp.gmail.com with ESMTPSA id iz17-20020a170902ef9100b001cfc170c0cfsm39772plb.119.2023.12.07.09.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 09:04:01 -0800 (PST)
Message-ID: <c0823649-8235-40d7-813e-8a4500251219@gmail.com>
Date: Thu, 7 Dec 2023 22:33:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20231206150602.176574-1-ayushdevel1325@gmail.com>
 <20231206150602.176574-2-ayushdevel1325@gmail.com>
 <2023120758-coleslaw-unstopped-530c@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023120758-coleslaw-unstopped-530c@gregkh>
X-Rspamd-Queue-Id: 565C23EFBD
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
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
Message-ID-Hash: JNVHDOLBMEM2ZC3TKUIO4C6SOGPGN7R7
X-Message-ID-Hash: JNVHDOLBMEM2ZC3TKUIO4C6SOGPGN7R7
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JNVHDOLBMEM2ZC3TKUIO4C6SOGPGN7R7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

>> + *
>> + * @cport: cport id
>> + * @hdr: greybus operation header
>> + * @payload: greybus message payload
>> + */
>> +struct hdlc_greybus_frame {
>> +	__le16 cport;
>> +	struct gb_operation_msg_hdr hdr;
>> +	u8 payload[];
>> +} __packed;
>> +
>>   static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>>   {
>> -	u16 cport_id;
>> -	struct gb_operation_msg_hdr *hdr = (struct gb_operation_msg_hdr *)buf;
>> +	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
>> +	u16 cport_id = le16_to_cpu(gb_frame->cport);
>>   
>> -	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
>> +	/* Ensure that the greybus message is valid */
>> +	if (le16_to_cpu(gb_frame->hdr.size) > len - sizeof(cport_id)) {
>> +		dev_warn_ratelimited(&bg->sd->dev, "Invalid/Incomplete greybus message");
> Don't spam the kernel log for corrupted data on the line, that would be
> a mess.  Use a tracepoint?
>
>> +		return;
>> +	}
>>   
>>   	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
>> -		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
>> +		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);
> Better yet, put the error in the debug message?
Shouldn't corrupt data be a warning rather than debug message, since it 
indicates something wrong with the transport?
>>   
>> -	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
>> +	greybus_data_rcvd(bg->gb_hd, cport_id, &buf[sizeof(cport_id)],
> Fun with pointer math.  This feels really fragile, why not just point to
> the field instead?
It seems that taking address of members of packed structures is not 
valid. I get the `address-of-packed-member` warnings. Is it fine to 
ignore those in kernel?
>>   }
>>   
>>   static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
>> @@ -339,7 +357,7 @@ static struct serdev_device_ops gb_beagleplay_ops = {
>>   static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
>>   {
>>   	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
>> -	struct hdlc_payload payloads[2];
>> +	struct hdlc_payload payloads[3];
> why 3?
>
> It's ok to put this on the stack?

Well, the HDLC payload is just to store the length of the payload along 
with a pointer to its data. (kind of emulate a fat pointer). The reason 
for doing it this way is to avoid having to create a temp buffer for 
each message when sending data over UART (which was done in the initial 
version of the driver).

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
